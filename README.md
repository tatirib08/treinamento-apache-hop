# Treinamento-apache-hop

Esse repositório tem como objetivo disponibilizar o trabalho realizado na disciplina de Tópicos Especiais em Engenharia de Software.

## Objetivo da tarefa

Realizar uma pipeline de dados de currículo lattes de pesquisadores, utilizando a ferramenta Apache Hop.

As etapas realizadas foram: 

1. Fonte dos dados: os dados foram extraídos de dois arquivos xml, que continham as informações desejadas de currículos lattes de dois pesquisadores.
2. Criação do banco: foi utilizada a ferramenta HeidiSQL, na qual o database BD_PESQUISADOR foi criado. O script de criação das tabelas está no arquivo creation_script.sql
3. Extração e população das tabelas usando duas pipelines de dados no Apache Hop, sendo elas: Dados_Pesquisadores_Varios e Dados_Producoes_Pesquisadores_Varios. Todos os arquivos de pipeline estão no diretório pipeline.
4. Análise dos dados usando PowerBI.

### Configuração de ambiente:

A tarefa foi desenvolvida no ambiente Ubuntu 24.04, portanto o container Docker está com comandos específicos para esse SO. 

### Busca textual

O módulo de busca textual no banco se encontra no diretório /busca_textual.