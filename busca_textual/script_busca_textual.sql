-- PARTE 1: CONSTRUINDO O DOCUMENTO
SELECT producoes.nomeartigo || ' ' || producoes.anoartigo || ' ' ||
producoes.issn || ' ' || pesquisadores.nome AS document
FROM producoes 
INNER JOIN pesquisadores ON producoes.pesquisadores_id=pesquisadores.pesquisadores_id


