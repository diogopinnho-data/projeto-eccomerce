SELECT
    p.product_id,
    p.product_name,

    SUM(
        CASE
            WHEN EXTRACT(YEAR FROM o.order_date) = 2024
            THEN oi.quantity
            ELSE 0
        END
    ) AS unidades_2024,

    SUM(
        CASE
            WHEN EXTRACT(YEAR FROM o.order_date) = 2025
            THEN oi.quantity
            ELSE 0
        END
    ) AS unidades_2025

FROM orders AS o

INNER JOIN order_items AS oi
    ON o.order_id = oi.order_id

INNER JOIN products AS p
    ON oi.product_id = p.product_id

WHERE o.status = 'delivered'
  AND o.order_date >= '2024-01-01'
  AND o.order_date < '2026-01-01'

GROUP BY
    p.product_id,
    p.product_name

ORDER BY
    unidades_2024 DESC;