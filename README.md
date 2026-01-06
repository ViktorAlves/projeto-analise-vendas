# 📊 Projeto de Análise de Dados – E-commerce

## 📌 Visão Geral

Este projeto tem como objetivo realizar uma **análise completa de dados de e-commerce**, passando por todas as etapas do processo analítico: desde a obtenção dos dados, modelagem e consultas em banco de dados, até a criação de **indicadores de desempenho (KPIs)**, **dashboards gerenciais** e **análises exploratórias**.

O foco principal foi simular um **cenário real de análise de dados**, utilizando ferramentas amplamente adotadas no mercado, como PostgreSQL, Power BI e Excel.

---

## 🧠 Apoio e Planejamento do Projeto

- Utilização do **ChatGPT** para:
  - Geração de ideias iniciais para a concepção do projeto;
  - Apoio na definição de KPIs;
  - Esclarecimento de dúvidas pontuais durante o desenvolvimento.

- Criação de um **portfólio no GitHub** para:
  - Centralizar o projeto;
  - Facilitar a visualização do código, documentação e resultados;
  - Demonstrar organização e versionamento.

---

## 📂 Fonte de Dados

- Dados obtidos através da plataforma **Kaggle**.
- Dataset utilizado:
  - **E-COMMERCE DATA**
  - Link: https://www.kaggle.com/datasets/benroshan/ecommerce-data

Os dados foram disponibilizados em arquivos CSV e representam informações de vendas, pedidos e metas a serem atingidas.

---

## 🗄️ Banco de Dados – PostgreSQL

### Estruturação do Banco

- Criação de um banco de dados no **PostgreSQL**.
- Modelagem e criação das tabelas com base na estrutura dos arquivos CSV do dataset.
- Criação das colunas utilizando **SQL**, respeitando tipos de dados, chaves primárias e relacionamentos quando aplicável.

### Carga de Dados

- Importação dos dados dos arquivos CSV para as tabelas do PostgreSQL utilizando a funcionalidade **Import/Export**.
- Cada arquivo CSV foi importado para sua respectiva tabela, mantendo padronização de nomes e estrutura.

### Consultas SQL

- Desenvolvimento de consultas SQL para:
  - Análise de vendas;
  - Cálculo de métricas como receita, quantidade vendida, total de pedidos e clientes;
  - Criação de visões analíticas que serviram de base para os KPIs e dashboards.

- Utilização do **DeepSeek** como apoio para:
  - Correção de erros de sintaxe;
  - Otimização de consultas SQL.

---

## 📈 Power BI – KPIs e Dashboards

### Indicadores de Desempenho (KPIs)

No Power BI foram criados KPIs estratégicos, tais como:

- Receita Total  
- Lucro Total  
- Ticket Médio por Pedido  
- Quantidade Total Vendida  
- Total de Pedidos  
- Total de Clientes  
- Meta de Vendas  
- Desempenho em relação à Meta  

Esses indicadores foram implementados utilizando **medidas em DAX**, garantindo flexibilidade e atualização dinâmica conforme filtros e segmentações.

### Dashboards

- Criação de:
  - **Dashboard Financeiro**, focado em receita, lucro e desempenho de vendas;
  - **Dashboard Gerencial**, voltado para acompanhamento de metas e indicadores operacionais.

- Os dashboards foram projetados para facilitar a leitura, apoiar a tomada de decisão e permitir análises por diferentes dimensões (como categoria, período, etc.).

---

## 📑 Excel – Tratamento e Análise Complementar

O **Excel** foi utilizado como ferramenta complementar ao projeto, com as seguintes finalidades:

- Tratamento dos dados:
  - Remoção de duplicatas;
  - Validação de consistência dos dados;
  - Conferência dos valores utilizados nos KPIs.

- Validação dos indicadores:
  - Comparação dos resultados obtidos no Excel com os KPIs calculados no Power BI, garantindo confiabilidade dos números.

- Análise exploratória:
  - Tentativa de identificar padrões, comportamentos e insights iniciais nos dados;
  - Elaboração de um relatório simples descrevendo as principais informações encontradas.

---

## 🛠️ Tecnologias Utilizadas

- PostgreSQL  
- SQL  
- Power BI  
- DAX  
- Excel  
- Kaggle  
- GitHub  
- ChatGPT  
- DeepSeek  

---

## 🎯 Conclusão

Este projeto permitiu aplicar, na prática, conceitos fundamentais de **engenharia e análise de dados**, integrando múltiplas ferramentas e etapas do fluxo analítico. O resultado final demonstra não apenas a construção de dashboards, mas todo o raciocínio por trás da coleta, tratamento, modelagem e análise dos dados.

---

📌 *Projeto desenvolvido com foco em aprendizado, prática e construção de portfólio profissional.*

