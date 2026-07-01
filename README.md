# 🛍️ Diagnóstico de Performance Logística e Satisfação de Clientes da Olist

## Análise da eficiência logística da Olist e seu impacto na satisfação dos clientes, identificando gargalos regionais de entrega, categorias com prazos subestimados e a correlação direta entre atrasos e queda no Review Score.
---

## 📌 Contexto

A Olist é um ecossistema integrador de e-commerce que conecta pequenos lojistas aos principais marketplaces do Brasil, centralizando a gestão de catálogos e a operação logística. Com milhões de pedidos processados, qualquer ineficiência no processo de entrega se traduz diretamente em insatisfação do cliente e impacto na reputação da plataforma.

Este projeto investiga **onde, quando e por que as entregas falham** — e quantifica o custo dessa falha em termos de experiência do usuário.

---

## 🎯 Objetivo

Identificar padrões regionais de atraso, categorias de produtos com prazos subestimados e correlacionar a impontualidade logística com a queda no Review Score, convertendo dados brutos em recomendações estratégicas acionáveis.

---

## 🛠️ Ferramentas e Tecnologias

| Ferramenta | Uso |
|---|---|
| SQL Server | Extração, consolidação e lógica de negócio |
| Power BI | Modelagem, DAX e visualização |
| Power Query | Limpeza e transformação de dados |

**Técnicas aplicadas:** JOINs entre múltiplas tabelas, CTEs para regras de atraso, Views reutilizáveis, medidas DAX (Taxa de Atraso, Médias Móveis, Ranking Top N), Star Schema.

---

## 📊 Dataset

- **Fonte:** [Brazilian E-Commerce Public Dataset by Olist — Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- **Composição:** 9 tabelas relacionadas cobrindo pedidos, clientes, produtos, vendedores, pagamentos e avaliações

---

## 🔍 Processo Analítico

**1. Extração e Tratamento (SQL Server)**
Consolidação de múltiplas tabelas via JOINs, criação de Views e definição de regras de atraso via CTEs — separando pedidos pontuais de atrasados com base na diferença entre data prometida e data real de entrega.

**2. Modelagem (Power BI & DAX)**
Estruturação do modelo em Star Schema, limpeza via Power Query e criação de medidas de performance: Taxa de Atraso por estado/categoria, Médias Móveis mensais e Ranking Top N de piores rotas.

**3. Visualização (Storytelling)**
Dashboard com foco em correlação (gráfico de dispersão), distribuição geográfica (Treemap) e tendências temporais — construído para guiar o leitor do diagnóstico à recomendação.

---

## 📈 Principais Resultados

### 1. Atrasos críticos concentrados na Região Nordeste
Estados como Alagoas (20,8%) e Maranhão (17,1%) registram taxa de atraso até **3x superior à média nacional de 7%**. O problema não é a distância em si — o Amazonas, geograficamente mais distante, apresenta taxas menores — mas o **erro sistemático na promessa de prazo** para essas rotas.

> 💡 **Recomendação:** Estender o SLA para o Nordeste em 3–5 dias úteis para alinhar expectativa à capacidade logística real.

---

### 2. Ineficiência de entrega para categorias de alta cubagem
Categorias como Móveis e Itens de Casa registram atrasos superiores a **13% — o dobro da média da plataforma**. Itens volumosos dependem de transportadoras de carga pesada com menor frequência de saída, e geram o maior volume de avaliações 1 e 2.

> 💡 **Recomendação:** Implementar SLAs segmentados por cubagem e priorizar transportadoras especializadas para essas categorias.

---

### 3. Correlação direta entre atraso e queda na satisfação
O atraso derruba a nota média de avaliação de **4,21 para 2,26** — uma queda de 1,95 pontos. Mesmo representando uma parcela minoritária do volume total (6.381 pedidos), os atrasos são responsáveis por puxar a média de satisfação abaixo da zona de neutralidade (3,0).

> 💡 **Recomendação:** Criar fluxo de comunicação proativa com cupons automáticos para pedidos com "atraso iminente", reduzindo o impacto no Review Score.

---

### 4. Sazonalidade e vulnerabilidade operacional
A taxa de atraso apresenta picos críticos de **13% em março** e **12% em dezembro** (Black Friday/Natal), evidenciando que a infraestrutura satura rapidamente sob demanda elevada. Com estoque centralizado no Sudeste, qualquer variação em rotas longas vira atraso imediato.

> 💡 **Recomendação:** Implementar modelo de Fulfillment regional com centros de distribuição avançados para produtos de alto giro (curva A) nas capitais do Nordeste.

---

## ✅ Aprendizados e Decisões Técnicas

- A definição de "atraso" foi construída via CTE considerando a diferença entre `order_estimated_delivery_date` e `order_delivered_customer_date`, não apenas datas de envio — o que torna a análise mais fiel à experiência do cliente.
- O uso de Médias Móveis suavizou ruídos na análise temporal e tornou os picos sazonais mais evidentes.
- O Star Schema no Power BI permitiu cruzar dimensões (região, categoria, período) sem duplicação de dados.

---

Projeto completo em https://rebrand.ly/larissa-portfolio
