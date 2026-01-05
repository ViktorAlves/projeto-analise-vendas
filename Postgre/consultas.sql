-- ============================================
-- CONSULTAS SQL PARA ANÁLISE DE VENDAS
-- ============================================

-- VISÃO GERAL DAS TABELAS E VOLUMES
SELECT 
    'listoforders' AS tabela,
    COUNT(*) AS total_registros,
    MIN("Order Date") AS data_inicial,
    MAX("Order Date") AS data_final
FROM listoforders
UNION ALL
SELECT 
    'orderdetails',
    COUNT(*),
    NULL,
    NULL
FROM orderdetails
UNION ALL
SELECT 
    'salestarget',
    COUNT(*),
    NULL,
    NULL
FROM salestarget;

-- DISTRIBUIÇÃO GEOGRÁFICA DOS CLIENTES
SELECT 
    "State" AS estado,
    COUNT(DISTINCT "CustomerName") AS total_clientes,
    COUNT("Order ID") AS total_pedidos,
    ROUND(COUNT("Order ID") * 1.0 / COUNT(DISTINCT "CustomerName"), 2) AS pedidos_por_cliente
FROM listoforders
GROUP BY "State"
ORDER BY total_clientes DESC;

-- CATEGORIAS E SUBCATEGORIAS DISPONÍVEIS
SELECT 
    "Category" AS categoria,
    "Sub-Category" AS subcategoria,
    COUNT(*) AS total_itens_vendidos,
    ROUND(AVG("Amount"), 2) AS valor_medio_item,
    ROUND(AVG("Profit"), 2) AS lucro_medio_item
FROM orderdetails
GROUP BY "Category", "Sub-Category"
ORDER BY "Category", total_itens_vendidos DESC;


-- VENDAS TOTAIS POR CATEGORIA (TOP 5)
SELECT 
    od."Category" AS categoria,
    SUM(od."Amount") AS total_vendas,
    SUM(od."Profit") AS total_lucro,
    SUM(od."Quantity") AS total_unidades,
    ROUND(SUM(od."Profit") / SUM(od."Amount") * 100, 2) AS margem_percentual
FROM orderdetails od
GROUP BY od."Category"
ORDER BY total_vendas DESC
LIMIT 5;

-- CLIENTES MAIS LUCRATIVOS (TOP 10)
SELECT 
    lo."CustomerName" AS cliente,
    lo."State" AS estado,
    lo."City" AS cidade,
    COUNT(DISTINCT lo."Order ID") AS total_pedidos,
    ROUND(SUM(od."Amount"), 2) AS valor_total_gasto,
    ROUND(SUM(od."Profit"), 2) AS lucro_gerado,
    ROUND(AVG(od."Amount"), 2) AS ticket_medio
FROM listoforders lo
JOIN orderdetails od ON lo."Order ID" = od."Order ID"
GROUP BY lo."CustomerName", lo."State", lo."City"
HAVING COUNT(DISTINCT lo."Order ID") >= 2
ORDER BY lucro_gerado DESC
LIMIT 10;

-- SUB-CATEGORIAS COM MAIOR LUCRO
SELECT 
    "Sub-Category" AS subcategoria,
    "Category" AS categoria,
    COUNT(*) AS transacoes,
    ROUND(SUM("Amount"), 2) AS faturamento,
    ROUND(SUM("Profit"), 2) AS lucro,
    ROUND(SUM("Profit") / SUM("Amount") * 100, 2) AS margem
FROM orderdetails
GROUP BY "Sub-Category", "Category"
ORDER BY lucro DESC
LIMIT 8;



-- DESEMPENHO VS META - CATEGORIA E MÊS
WITH vendas_mensais AS (
    SELECT 
        TO_CHAR(lo."Order Date", 'Mon-YY') AS mes_ano,
        od."Category" AS categoria,
        SUM(od."Amount") AS vendas_realizadas,
        SUM(od."Profit") AS lucro_realizado
    FROM listoforders lo
    JOIN orderdetails od ON lo."Order ID" = od."Order ID"
    GROUP BY TO_CHAR(lo."Order Date", 'Mon-YY'), od."Category"
)
SELECT 
    st."Month of Order Date" AS mes_referencia,
    st."Category" AS categoria,
    st."Target" AS meta_vendas,
    COALESCE(vm.vendas_realizadas, 0) AS vendas_realizadas,
    COALESCE(vm.lucro_realizado, 0) AS lucro_realizado,
    ROUND(
        COALESCE(vm.vendas_realizadas, 0) * 100.0 / 
        NULLIF(st."Target", 0), 
        2
    ) AS percentual_atingido
FROM salestarget st
LEFT JOIN vendas_mensais vm 
    ON st."Month of Order Date" = vm.mes_ano 
    AND st."Category" = vm.categoria
ORDER BY st."Month of Order Date", st."Category";

-- ANÁLISE COMPLETA DE PEDIDOS
SELECT 
    lo."Order ID" AS pedido_id,
    lo."Order Date" AS data_pedido,
    lo."CustomerName" AS cliente,
    lo."City" || ' - ' || lo."State" AS localidade,
    COUNT(od."Order ID") AS total_itens,
    SUM(od."Quantity") AS total_unidades,
    ROUND(SUM(od."Amount"), 2) AS valor_total,
    ROUND(SUM(od."Profit"), 2) AS lucro_total,
    ROUND(AVG(od."Profit" / od."Amount") * 100, 2) AS margem_media
FROM listoforders lo
JOIN orderdetails od ON lo."Order ID" = od."Order ID"
GROUP BY lo."Order ID", lo."Order Date", lo."CustomerName", lo."City", lo."State"
HAVING COUNT(od."Order ID") > 1
ORDER BY valor_total DESC
LIMIT 15;

-- PERFORMANCE POR ESTADO
SELECT 
    lo."State" AS estado,
    COUNT(DISTINCT lo."CustomerName") AS clientes_unicos,
    COUNT(DISTINCT lo."Order ID") AS pedidos,
    ROUND(SUM(od."Amount"), 2) AS receita_estado,
    ROUND(SUM(od."Profit"), 2) AS lucro_estado,
    ROUND(SUM(od."Profit") / SUM(od."Amount") * 100, 2) AS margem_estado
FROM listoforders lo
JOIN orderdetails od ON lo."Order ID" = od."Order ID"
GROUP BY lo."State"
ORDER BY receita_estado DESC;


-- SAZONALIDADE - VENDAS POR MÊS
SELECT 
    EXTRACT(YEAR FROM lo."Order Date") AS ano,
    EXTRACT(MONTH FROM lo."Order Date") AS mes_numero,
    TO_CHAR(lo."Order Date", 'Month') AS mes_nome,
    COUNT(DISTINCT lo."Order ID") AS total_pedidos,
    COUNT(DISTINCT lo."CustomerName") AS clientes_ativos,
    ROUND(SUM(od."Amount"), 2) AS vendas_mensais,
    ROUND(AVG(od."Amount"), 2) AS ticket_medio
FROM listoforders lo
JOIN orderdetails od ON lo."Order ID" = od."Order ID"
GROUP BY 
    EXTRACT(YEAR FROM lo."Order Date"),
    EXTRACT(MONTH FROM lo."Order Date"),
    TO_CHAR(lo."Order Date", 'Month')
ORDER BY ano DESC, mes_numero;

-- CRESCIMENTO MENSAL (MOM)
WITH base_mensal AS (
    SELECT 
        DATE_TRUNC('month', lo."Order Date") AS mes,
        SUM(od."Amount") AS vendas_mes
    FROM listoforders lo
    JOIN orderdetails od ON lo."Order ID" = od."Order ID"
    GROUP BY DATE_TRUNC('month', lo."Order Date")
)
SELECT 
    TO_CHAR(mes, 'Mon-YY') AS mes_ano,
    ROUND(vendas_mes, 2) AS vendas_atual,
    ROUND(LAG(vendas_mes) OVER (ORDER BY mes), 2) AS vendas_anterior,
    ROUND(
        (vendas_mes - LAG(vendas_mes) OVER (ORDER BY mes)) * 100.0 / 
        NULLIF(LAG(vendas_mes) OVER (ORDER BY mes), 0), 
        2
    ) AS crescimento_percentual
FROM base_mensal
ORDER BY mes;

-- PEDIDOS POR DIA DA SEMANA
SELECT 
    TO_CHAR("Order Date", 'Day') AS dia_semana,
    COUNT(DISTINCT "Order ID") AS total_pedidos,
    COUNT(DISTINCT "CustomerName") AS clientes,
    ROUND(COUNT(DISTINCT "Order ID") * 1.0 / 7, 1) AS media_diaria
FROM listoforders
GROUP BY TO_CHAR("Order Date", 'Day'), EXTRACT(DOW FROM "Order Date")
ORDER BY EXTRACT(DOW FROM "Order Date");


-- DASHBOARD DE KPIs PRINCIPAIS
WITH base_metrics AS (
    SELECT 
        COUNT(DISTINCT lo."CustomerName") AS total_clientes,
        COUNT(DISTINCT lo."Order ID") AS total_pedidos,
        SUM(od."Amount") AS receita_total,
        SUM(od."Profit") AS lucro_total,
        SUM(od."Quantity") AS unidades_vendidas,
        AVG(od."Amount") AS ticket_medio_item
    FROM listoforders lo
    JOIN orderdetails od ON lo."Order ID" = od."Order ID"
)
SELECT 'Clientes Únicos' AS kpi, total_clientes AS valor FROM base_metrics
UNION ALL SELECT 'Total de Pedidos', total_pedidos FROM base_metrics
UNION ALL SELECT 'Receita Total (R$)', ROUND(receita_total, 2) FROM base_metrics
UNION ALL SELECT 'Lucro Total (R$)', ROUND(lucro_total, 2) FROM base_metrics
UNION ALL SELECT 'Unidades Vendidas', unidades_vendidas FROM base_metrics
UNION ALL SELECT 'Margem de Lucro (%)', 
    ROUND((lucro_total / receita_total) * 100, 2) FROM base_metrics
UNION ALL SELECT 'Ticket Médio por Item (R$)', 
    ROUND(ticket_medio_item, 2) FROM base_metrics
ORDER BY kpi;

-- EFICIÊNCIA POR CATEGORIA
SELECT 
    "Category" AS categoria,
    COUNT(*) AS transacoes,
    ROUND(SUM("Amount"), 2) AS receita,
    ROUND(SUM("Profit"), 2) AS lucro,
    ROUND(AVG("Profit" / "Amount") * 100, 2) AS margem_media,
    ROUND(SUM("Amount") / COUNT(DISTINCT "Order ID"), 2) AS receita_por_pedido
FROM orderdetails
GROUP BY "Category"
ORDER BY margem_media DESC;


-- ANÁLISE RFM SIMPLIFICADA
WITH rfm_calc AS (
    SELECT 
        lo."CustomerName" AS cliente,
        MAX(lo."Order Date") AS ultima_compra,
        COUNT(DISTINCT lo."Order ID") AS frequencia,
        SUM(od."Amount") AS valor_monetario,
        NTILE(3) OVER (ORDER BY MAX(lo."Order Date") DESC) AS recencia_score,
        NTILE(3) OVER (ORDER BY COUNT(DISTINCT lo."Order ID") DESC) AS frequencia_score,
        NTILE(3) OVER (ORDER BY SUM(od."Amount") DESC) AS valor_score
    FROM listoforders lo
    JOIN orderdetails od ON lo."Order ID" = od."Order ID"
    GROUP BY lo."CustomerName"
)
SELECT 
    cliente,
    ultima_compra,
    frequencia,
    ROUND(valor_monetario, 2) AS valor_gasto,
    recencia_score || frequencia_score || valor_score AS rfm_score,
    CASE 
        WHEN recencia_score = 3 AND frequencia_score = 3 AND valor_score = 3 THEN 'Cliente Ouro'
        WHEN recencia_score >= 2 AND frequencia_score >= 2 AND valor_score >= 2 THEN 'Cliente Prata'
        ELSE 'Cliente Bronze'
    END AS segmento
FROM rfm_calc
ORDER BY valor_monetario DESC
LIMIT 15;

-- PEDIDOS COM MAIOR LUCRO
SELECT 
    lo."Order ID" AS pedido,
    lo."Order Date" AS data,
    lo."CustomerName" AS cliente,
    STRING_AGG(od."Sub-Category", ', ') AS produtos,
    SUM(od."Quantity") AS unidades,
    ROUND(SUM(od."Amount"), 2) AS valor_total,
    ROUND(SUM(od."Profit"), 2) AS lucro_total,
    ROUND(SUM(od."Profit") / SUM(od."Amount") * 100, 2) AS margem
FROM listoforders lo
JOIN orderdetails od ON lo."Order ID" = od."Order ID"
GROUP BY lo."Order ID", lo."Order Date", lo."CustomerName"
HAVING SUM(od."Profit") > 0
ORDER BY lucro_total DESC
LIMIT 10;

-- PARTICIPAÇÃO DE MARKETSHARE POR CATEGORIA
SELECT 
    "Category" AS categoria,
    COUNT(*) AS vendas,
    ROUND(SUM("Amount"), 2) AS faturamento,
    ROUND(
        SUM("Amount") * 100.0 / SUM(SUM("Amount")) OVER (), 
        2
    ) AS participacao_mercado,
    ROUND(
        SUM("Profit") * 100.0 / SUM(SUM("Profit")) OVER (), 
        2
    ) AS participacao_lucro
FROM orderdetails
GROUP BY "Category"
ORDER BY participacao_mercado DESC;

-- VISÃO CONSOLIDADA PARA DASHBOARD
SELECT 
    DATE_TRUNC('month', lo."Order Date") AS mes,
    od."Category" AS categoria,
    COUNT(DISTINCT lo."CustomerName") AS clientes_ativos,
    COUNT(DISTINCT lo."Order ID") AS pedidos,
    SUM(od."Quantity") AS unidades,
    ROUND(SUM(od."Amount"), 2) AS receita,
    ROUND(SUM(od."Profit"), 2) AS lucro,
    ROUND(AVG(od."Amount"), 2) AS ticket_medio,
    ROUND(SUM(od."Profit") / SUM(od."Amount") * 100, 2) AS margem
FROM listoforders lo
JOIN orderdetails od ON lo."Order ID" = od."Order ID"
GROUP BY DATE_TRUNC('month', lo."Order Date"), od."Category"
ORDER BY mes DESC, receita DESC;

