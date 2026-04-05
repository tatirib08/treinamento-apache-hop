-- Criar schema (equivalente ao "database public" do MySQL)
CREATE SCHEMA IF NOT EXISTS public;

-- =========================
-- TABELA: pesquisadores
-- =========================
CREATE TABLE IF NOT EXISTS public.pesquisadores (
    pesquisadores_id VARCHAR(36) PRIMARY KEY,
    lattes_id VARCHAR(16) NOT NULL,
    nome VARCHAR(200) NOT NULL
);

-- Inserção (PostgreSQL não tem INSERT IGNORE → usamos ON CONFLICT)
INSERT INTO public.pesquisadores (pesquisadores_id, lattes_id, nome) VALUES
('a0a4768a-ba1a-47b8-aab4-b43f665a53c2', '1966167015825708', 'Hugo Saba Pereira Cardoso'),
('c26c8b36-ce2e-4bfb-82d8-24bdc55579d6', '6716225567627323', 'Eduardo Manuel de Freitas Jorge')
ON CONFLICT (pesquisadores_id) DO NOTHING;

-- =========================
-- TABELA: producoes
-- =========================
CREATE TABLE IF NOT EXISTS public.producoes (
    producoes_id VARCHAR(36) PRIMARY KEY,
    pesquisadores_id VARCHAR(36) NOT NULL,
    issn VARCHAR(16) NOT NULL,
    nomeartigo TEXT NOT NULL,
    anoartigo INTEGER NOT NULL,
    
    CONSTRAINT fk_pesquisador
        FOREIGN KEY (pesquisadores_id)
        REFERENCES public.pesquisadores(pesquisadores_id)
        ON DELETE CASCADE
);

-- Inserção
INSERT INTO public.producoes (producoes_id, pesquisadores_id, issn, nomeartigo, anoartigo) VALUES
	('cef5b171-fe81-4d62-91c5-af03ca55f7a6', 'c26c8b36-ce2e-4bfb-82d8-24bdc55579d6', '25956825', 'Dinâmica de ensino baseada em fabricação digital e PBL para apoiar os professores de psicologia na apresentação do Teste de Pirâmide Colorida Pfister / Teaching dynamics based on digital fabrication and PBL to support psychology teachers in presenting the Pfister Color Pyramid Test', 2021),
	('4f8664c4-d5c2-4c3c-94d9-bc1667d91ac1', 'a0a4768a-ba1a-47b8-aab4-b43f665a53c2', '14131536', 'Indicação de Procedência: potencial do Recôncavo da Bahia no reconhecimento da  produção artesanal de licores de frutas', 2017),
	('c0ffa837-06a7-45ab-afee-2c4de9472396', 'a0a4768a-ba1a-47b8-aab4-b43f665a53c2', '03784371', 'Self-affinity and self-organized criticality applied to the relationship between the economic arrangements and the dengue fever spread in Bahia', 2018),
	('6cc8d0bf-cbb1-47f0-8a78-2bef04291403', 'c26c8b36-ce2e-4bfb-82d8-24bdc55579d6', '16604601', 'A Critical Analysis of the COVID-19 Hospitalization Network in Countries with Limited Resources', 2022),
	('5df7f5d6-edb6-4aeb-b68e-52ef5c993065', 'a0a4768a-ba1a-47b8-aab4-b43f665a53c2', '25254553', 'CENÁRIO DO GRUPO DE APOIO ÀS CRIANÇAS COM CÂNCER (GACCBA): PROPOSTA DE UM AMBIENTE VIRTUAL COLABORATIVO COMO INSTRUMENTO DE INTERAÇÃO, PARTICIPAÇÃO E CONTRIBUIÇÃO PARA A INSTITUIÇÃO', 2020),
	('f2db8aa3-d787-4070-87fa-7c443230204a', 'c26c8b36-ce2e-4bfb-82d8-24bdc55579d6', '17554365', 'Synchronized spread of COVID-19 in the cities of Bahia, Brazil', 2022),
	('858457e0-c230-47f4-a2d0-30299d1746bb', 'a0a4768a-ba1a-47b8-aab4-b43f665a53c2', '14712458', 'Spatio-temporal correlation networks of dengue in the state of Bahia', 2014),
	('e45cc2d5-094a-44fc-86ce-abd648722630', 'a0a4768a-ba1a-47b8-aab4-b43f665a53c2', '01291831', 'Self-affinity in the dengue fever time series', 2016),
	('8082e625-110d-436a-83d7-fd66a9e88c11', 'a0a4768a-ba1a-47b8-aab4-b43f665a53c2', '01000233', 'BIOSSEGURANÇA EM ONCOLOGIA E O PROFISSIONAL FARMACÊUTICO: ANÁLISE DE PRESCRIÇÃO E MANIPULAÇÃO DE MEDICAMENTOS ANTINEOPLÁSICOS', 2017),
	('414cc16c-3ba8-48b6-896c-1cde53cd1cd1', 'a0a4768a-ba1a-47b8-aab4-b43f665a53c2', '17466148', 'Humoral and cellular immune responses in mice against secreted and somatic antigens from a Corynebacterium pseudotuberculosis attenuated strain: Immune response against a C. pseudotuberculosis strain', 2016),
	('4c44363d-5ca4-43b4-bc18-1c9e8afeedcb', 'a0a4768a-ba1a-47b8-aab4-b43f665a53c2', '25258761', 'ROBÔS CIRÚRGICOS: PROSPECÇÃO DE PATENTES RELACIONADAS A APLICAÇÕES HUMANAS', 2020),
	('e924419c-9b80-4b5f-80ba-2048623edf63', 'a0a4768a-ba1a-47b8-aab4-b43f665a53c2', '01672789', 'Scaling effect in COVID-19 spreading: The role of heterogeneity in a hybrid ODE-network model with restrictions on the inter-cities flow', 2021),
	('02caa99c-11e6-41e5-bd20-1626533ccc23', 'a0a4768a-ba1a-47b8-aab4-b43f665a53c2', '19326203', 'Correlation between hospitalized patients? demographics, symptoms, comorbidities, and COVID-19 pandemic in Bahia, Brazil', 2020),
	('83dce8a2-f936-4fc8-bafe-1fd4251f7817', 'a0a4768a-ba1a-47b8-aab4-b43f665a53c2', '09277757', 'Preparation of hybrid nanocomposite particles for medical practices', 2021),
	('b809a3ee-307c-4ce4-9cbb-ae7b1034c55d', 'a0a4768a-ba1a-47b8-aab4-b43f665a53c2', '20452322', 'A spatio-temporal analysis of dengue spread in a Brazilian dry climate region', 2021),
	('ceda228a-b4d6-4aba-8684-ddf1804b6f38', 'a0a4768a-ba1a-47b8-aab4-b43f665a53c2', '2076393X', 'Retrospective Cohort Study of COVID-19 in Patients of the Brazilian Public Health System with SARS-CoV-2 Omicron Variant Infection', 2022),
	('1cbeab75-f175-4f48-a495-fc9fd237addb', 'a0a4768a-ba1a-47b8-aab4-b43f665a53c2', '23496495', 'Business Incubators and Sustainability: A Literature Review', 2022),
	('538bb0bf-adc9-4246-bd31-fcc1ba0c177a', 'a0a4768a-ba1a-47b8-aab4-b43f665a53c2', '2296424X', 'Network analysis of spreading of dengue, Zika and chikungunya in the state of Bahia based on notified, confirmed and discarded cases', 2022),
	('b9da4c12-8b40-4b49-8ff6-11cdf77d4a19', 'a0a4768a-ba1a-47b8-aab4-b43f665a53c2', '25253514', 'Os jovens podem participar? Considerações acerca da participação e formação políticas juvenis', 2022),
	('cff46267-2cc1-4582-aaa8-66830bbd38dd', 'a0a4768a-ba1a-47b8-aab4-b43f665a53c2', '09600779', 'Complex network analysis of arboviruses in the same geographic domain: Differences and similarities', 2023),
	('17972100-4861-48f7-bc3a-e1f13e3831fe', 'c26c8b36-ce2e-4bfb-82d8-24bdc55579d6', '20711050', 'Analysis of Hydrous Ethanol Price Competitiveness after the Implementation of the Fossil Fuel Import Price Parity Policy in Brazil', 2021),
	('25c3391d-29ac-43a2-aaf3-92e279604560', 'a0a4768a-ba1a-47b8-aab4-b43f665a53c2', '21757275', 'Uma Revisão Sistemática dos Indicadores da Saúde e Bem-Estar no Brasil: Cenário Atual e Perspectivas Futuras da Agenda 2030', 2023),
	('a639835d-ab45-409d-a169-23b137365cd3', 'c26c8b36-ce2e-4bfb-82d8-24bdc55579d6', '24112933', 'An evaluation model for accessibility conditions of salvador bus stops', 2022),
	('f5468f7a-3a53-443f-8814-73b45dd54d61', 'a0a4768a-ba1a-47b8-aab4-b43f665a53c2', '23293284', 'The Importance of the Facility Location Techniques to Assist Companies in Decision-Making for the Installation of Logistics Hub', 2024),
	('de3635d8-4761-4415-8b5c-4071aecb946b', 'c26c8b36-ce2e-4bfb-82d8-24bdc55579d6', '21788030', 'IMPRESSÃO 3D: DA PESQUISA AO SETOR PRODUTIVO Um estudo exploratório sobre sua evolução histórica, origem, tecnologias, aplicações e inovações', 2022),
	('e3cecf63-d358-413c-b5fa-e4d1ed9c90f0', 'c26c8b36-ce2e-4bfb-82d8-24bdc55579d6', '21789010', 'Desenvolvimento sustentável: uma proposta para descarbonização de frotas de veículos', 2023),
	('4b97b9a9-faf5-4f6f-8155-d235643c7bf7', 'a0a4768a-ba1a-47b8-aab4-b43f665a53c2', '19830882', 'Percepções juvenis sobre as fake news em seus processos de formação e participação políticas', 2024),
	('e29e59f7-7f82-4c04-9b15-c6d2f52d875c', 'c26c8b36-ce2e-4bfb-82d8-24bdc55579d6', '23166517', 'SAÚDE PÚBLICA: PROSPECÇÃO TECNOLÓGICA DOS REGISTROS DE SOFTWARES PARA O COMBATE A DENGUE', 2022),
	('8b843d12-935f-41d7-be0b-be57ca4f0fdf', 'c26c8b36-ce2e-4bfb-82d8-24bdc55579d6', '19805551', 'Estrutura Organizacional Alernativa Para Desenvolvimento de Software, em Fábrica de Software', 2007),
	('66431c9d-5a0b-4dfc-9864-18383463b9ca', 'c26c8b36-ce2e-4bfb-82d8-24bdc55579d6', '03029743', 'A Framework for Context-Aware Systems in Mobile Devices', 2012),
	('a65ddfd9-6795-4f0d-9af2-fc59938aed2f', 'c26c8b36-ce2e-4bfb-82d8-24bdc55579d6', '21792534', 'Perspectiva teórico epistemológica da modelagem conceitual relacionada com a análise cognitiva e semiótica no contexto da difusão do conhecimento em ambientes virtuais de aprendizagem', 2012),
	('9c72d0bb-5b4e-48c8-880b-8776d2cfb162', 'c26c8b36-ce2e-4bfb-82d8-24bdc55579d6', '22360972', 'GERENCIAMENTO DE PROJETO OTIMISTA (GPO): UM MÉTODO QUE INTEGRA PERT/CPM À CCPM', 2011),
	('6aac820a-f254-40d8-9db3-f2e850695b32', 'c26c8b36-ce2e-4bfb-82d8-24bdc55579d6', '00313203', 'A mobile, lightweight, poll-based food identification system', 2014),
	('69ce0e7c-3519-44e3-a508-a5be99b5d001', 'c26c8b36-ce2e-4bfb-82d8-24bdc55579d6', '15487709', 'Correlation between Transport and Occurrence of Dengue Cases in Bahia', 2014),
	('9460e49f-749d-443f-8d7b-13ead18da95c', 'c26c8b36-ce2e-4bfb-82d8-24bdc55579d6', '19832192', 'A REVOLUÇÃO DA ROBÓTICA UTILIZANDO LIXO ELETRÔNICO NO ENSINO BÁSICO: FORMAÇÃO AMPLIADA E MENOR VULNERABILIDADE DE JOVENS À VIOLÊNCIA NAS ESCOLAS PÚBLICAS', 2016),
	('4c89f151-5efb-42a7-9769-ebbb45d36ac7', 'c26c8b36-ce2e-4bfb-82d8-24bdc55579d6', '22372903', 'Um Sistema de apoio a Gerência de Requisitos Aderente ao MPS.BR', 2018),
	('f1837107-a66e-4315-83ef-a5b86d416f45', 'c26c8b36-ce2e-4bfb-82d8-24bdc55579d6', '00489697', 'Relevance of transportation to correlations among criticality, physical means of propagation, and distribution of dengue fever cases in the state of Bahia', 2018),
	('3ddeee92-35c3-496f-9c91-36b974c2598f', 'c26c8b36-ce2e-4bfb-82d8-24bdc55579d6', '00105236', 'Maker Culture: dissemination of knowledge and development of skills and competencies for the 21st century', 2023),
	('41aa9421-6557-43bc-ad1d-0a1f03f5d151', 'c26c8b36-ce2e-4bfb-82d8-24bdc55579d6', '16762592', 'Inteligência Artificial e Virtualização em Ambientes Virtuais de Ensino e Aprendizagem: Desafios e Perspectivas Tecnológicas', 2021),
	('a31a3f84-0b19-4ca0-a144-8fb2fe711f7d', 'c26c8b36-ce2e-4bfb-82d8-24bdc55579d6', '15411389', 'Difusão e utilização de informações acadêmicas: um modelo de gestão do conhecimento para subsidiar gestores universitários', 2024),
	('959118a5-f92f-49c4-ac7a-f42f614bac4e', 'c26c8b36-ce2e-4bfb-82d8-24bdc55579d6', '19887833', 'Diretrizes para o planejamento de um ambiente de aprendizagem neuroarqeducativo', 2023),
	('66f6e611-bf28-47d9-aad8-56f9f467fa68', 'c26c8b36-ce2e-4bfb-82d8-24bdc55579d6', '23189584', 'CENÁRIO DO GRUPO DE APOIO ÀS CRIANÇAS COM CÂNCER (GACC-BA): PROPOSTA DE UM AMBIENTE VIRTUAL COLABORATIVO COMO INSTRUMENTO DE INTERAÇÃO, PARTICIPAÇÃO E CONTRIBUIÇÃO PARA A INSTITUIÇÃO', 2020),
	('74e607f1-bda2-4a50-9209-73ad903c14ef', 'c26c8b36-ce2e-4bfb-82d8-24bdc55579d6', '21757534', 'PROPOSTA DE (RE)DESIGN DO AMBIENTE EDUCATIVO FORMAL UNIVERSITÁRIO PARA ESTIMULAR UMA APRENDIZAGEM PROTAGONISTA, CRIATIVA E INOVADORA', 2020),
	('56c85dfa-dd2c-47ab-82dc-387ab45b47a3', 'c26c8b36-ce2e-4bfb-82d8-24bdc55579d6', '19818920', 'Arquitetura da Informação Analítica para Integração de Dados da Pesquisa e Pós-Graduação: Um Estudo de Caso da Universidade do Estado da Bahia', 2020),
	('be6ef61e-f044-4da5-b8aa-c97ac0a25146', 'c26c8b36-ce2e-4bfb-82d8-24bdc55579d6', '22309926', 'A METHOD FOR ONTOLOGY MODELING BASED ON INSTANCES CONCEPTUAL CLASSIFICATION AND FORMALIZATION', 2020),
	('7334defe-a8a1-464f-b7b3-0879b14c18a8', 'c26c8b36-ce2e-4bfb-82d8-24bdc55579d6', '18093957', 'ROBÓTICA EDUCACIONAL: CONSTRUÇÃO DE UMA DINÂMICA A PARTIR DO ROBÔ ARDU', 2020),
	('3bbc091c-7679-45f6-908d-c589a57caf96', 'c26c8b36-ce2e-4bfb-82d8-24bdc55579d6', '25253409', 'A teoria fundamentada em dados aplicada ao campo da educação superior', 2021),
	('36670ec8-245b-4ba7-b2f5-7c7736df7e93', 'c26c8b36-ce2e-4bfb-82d8-24bdc55579d6', '23170026', 'Portal de Acesso às Informações das Ações das Universidades Federais em Resposta à Pandemia de Covid-19: uma análise do período pandêmico até a transição para uma pós-pandemia', 2023),
	('71e319c0-4350-4309-ba82-a52b4564eec4', 'c26c8b36-ce2e-4bfb-82d8-24bdc55579d6', '1981223X', 'APLICAÇÃO DE CONCEITOS E CRITÉRIOS DE DESEMPENHO PARA UMA SALA DE AULA INOVADORA', 2023),
	('328deb44-00b2-4e93-9686-825dc4eca2df', 'c26c8b36-ce2e-4bfb-82d8-24bdc55579d6', '19831358', 'Solução para Mapeamento e Consulta das Competências dos Pesquisadores: uma arquitetura para extração, integração e consultas de informações acadêmicas', 2024);
ON CONFLICT (producoes_id) DO NOTHING;