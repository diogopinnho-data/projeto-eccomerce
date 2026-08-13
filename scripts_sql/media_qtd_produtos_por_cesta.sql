WITH produtos_por_pedido AS (
    SELECT
        o.order_id,
        EXTRACT(YEAR FROM o.order_date) AS ano,
        SUM(oi.quantity) AS quantidade_produtos

    FROM orders AS o

    JOIN order_items AS oi
        ON o.order_id = oi.order_id

    WHERE o.status = 'delivered'
      AND EXTRACT(YEAR FROM o.order_date) IN (2024, 2025)

    GROUP BY
        o.order_id,
        EXTRACT(YEAR FROM o.order_date)
)

SELECT
    ROUND(
        AVG(quantidade_produtos) FILTER (WHERE ano = 2024),
        2
    ) AS media_produtos_2024,

    ROUND(
        AVG(quantidade_produtos) FILTER (WHERE ano = 2025),
        2
    ) AS media_produtos_2025

FROM produtos_por_pedido;