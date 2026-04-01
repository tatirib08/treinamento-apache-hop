-- Por questões de simplificação, tudo foi realizado no mesmo script. Basta descomentar a parte que deseja executar.


-- PARTE 1: CONSTRUINDO O DOCUMENTO:

-- Estamos selecionando os campos daas tabelas que desejamos, e fazendo uma concatenação de strings. 
-- O documento final será uma string com as informações concatenadas.

-- SELECT producoes.nomeartigo || ' ' || producoes.anoartigo || ' ' ||
-- producoes.issn || ' ' || pesquisadores.nome AS document
-- FROM producoes 
-- INNER JOIN pesquisadores ON producoes.pesquisadores_id=pesquisadores.pesquisadores_id


-- PARTE 2: CRIANDO DOCUMENTO COMO TS_VECTOR:

-- Precisamos transformar o documento em um ts_vector, que é um vetor contendo os campos que selecionamos, para que possamos 
-- recuperar as informações que desejamos do documento final. Para isso, utilizamos a função to_tsvector(). OBS: essa função só funciona com strings, então
-- é preciso converter campos que não são de string, como o anoartigo, que é um inteiro, usando '::text'. 
-- A saída desse SQL para cada documento, é um conjunto de lexemas e suas posições no documento.

-- SELECT to_tsvector(producoes.nomeartigo ) || to_tsvector(producoes.anoartigo::text) ||
-- to_tsvector(producoes.issn) || to_tsvector(pesquisadores.nome) AS document
-- FROM producoes
-- INNER JOIN pesquisadores ON producoes.pesquisadores_id=pesquisadores.pesquisadores_id


-- PARTE 3: REALIZANDO CONSULTAS:

-- Agora que sabemos como o documento é montado, agora queremos encontrar o documento que contém aquele 'searh_text' que desejamos.
-- Utilizamos a função tsquery() para procurar o lexema que desejamos em um determinado texto. 
-- Ex: 
-- SELECT to_tsvector('It''s kind of fun to do the impossible') @@ to_tsquery('impossible');
-- A função vai retornar 'true' se o lexema esxistir no texto, ou 'false' se o lexema não estiver presente no texto
-- É possível usar operadores booleanos dentro da tsquery(), como AND (&), OR (|), NOT(!). Ex: tsquery('! fact');
-- Também dá para utilizar ':*' para buscar textos com prefixo específico. Ex: to_tsquery('theo:*');

-- Agora vamos usar esses conhecimentos para fazer a consulta nos documentos, como na parte 2:

-- SELECT id_artigo, titulo -- recuperamos a coluna peloas aliases
-- FROM (
--	SELECT producoes.producoes_id AS id_artigo, producoes.nomeartigo AS titulo, -- definimos aliases para as colunas que queremos recuperar
--	to_tsvector(producoes.nomeartigo ) || to_tsvector(producoes.anoartigo::text) ||
--	to_tsvector(producoes.issn) || to_tsvector(pesquisadores.nome) AS document
--	FROM producoes
--	INNER JOIN pesquisadores ON producoes.pesquisadores_id=pesquisadores.pesquisadores_id
-- ) busca_textual -- alias para o documento select
-- WHERE busca_textual.document @@ TO_TSQUERY('Critical & Analysis');


-- PARTE 4: SUPORTE A IDIOMAS
-- A função to_tsvector() suporta idiomas diferentes, e cada idioma tem as suas regras para montagem dos lexemas: stemming (redução de palavras) e stopwords (palavras ignoradas, como conectivos).
-- Vamos adicionar uma coluna de idioma para os artigos, com o default 'english'.

-- ALTER TABLE producoes ADD COLUMN idioma TEXT NOT NULL DEFAULT 'english' -- OBS: você pode mudar manualmente a lingua dos artigos depois se quiser. Eu mudei alguns que estão em português para 'portuguese'.

-- Vamos reconstruir o documento usando o idioma:

-- SELECT TO_TSVECTOR(producoes.idioma::regconfig, producoes.nomeartigo) || to_tsvector(producoes.anoartigo::text) ||
-- to_tsvector(producoes.issn) || to_tsvector(pesquisadores.nome) AS document
-- FROM producoes
-- INNER JOIN pesquisadores ON producoes.pesquisadores_id=pesquisadores.pesquisadores_id

-- PARTE 5: ACENTUAÇÃO NOS DOCUMENTOS:
-- Podemos usar uma extensão de nome unaccent para remover a acentuação de textos.
-- Ex:
-- CREATE extension unaccent;
-- SELECT unaccent('èéêë');

-- Nas buscas nem sempre escrevemos com acento, por isso é importante colocarmos essa regra de recuperação
-- do nome do artigo sem acento: 

-- SELECT to_tsvector(producoes.idioma::regconfig, unaccent(producoes.nomeartigo)) ||
--       to_tsvector(producoes.anoartigo::text) ||
--       to_tsvector(producoes.issn::text) ||
--       to_tsvector('simple', unaccent(pesquisadores.nome)) AS document
-- FROM producoes
-- INNER JOIN pesquisadores 
--  ON producoes.pesquisadores_id = pesquisadores.pesquisadores_id;


-- PARTE 6: CLASSIFICAÇÃO DOS DOCUMENTOS:
-- É importante para o ordenamento dos resultados por relevância, ou seja, os documentos que estiverem
-- mais 'adequados' à nossa string de busca terão notas maiores, e estarão no topo da lista.
-- Vamos atribuir pesos aos diferentes campos do documento. Nesse caso, o nome do artigo terá um peso maior,
-- em seguida o nome do pesquisador, o ano do artigo e por último o issn.

-- SELECT id_artigo, titulo,
--        ts_rank(document, to_tsquery('dengue')) AS relevancia
-- FROM (
--  SELECT p.producoes_id as id_artigo,
--         p.nomeartigo AS titulo,
--         setweight(to_tsvector(p.nomeartigo), 'A') ||
--         setweight(to_tsvector(p.anoartigo::text), 'C') ||
--         setweight(to_tsvector(p.issn::text), 'D') ||
--         setweight(to_tsvector(pes.nome), 'B') AS document
--  FROM producoes p
--  INNER JOIN pesquisadores pes
--    ON p.pesquisadores_id = pes.pesquisadores_id
-- ) busca_textual
-- WHERE busca_textual.document @@ to_tsquery('dengue')
-- ORDER BY relevancia DESC;


