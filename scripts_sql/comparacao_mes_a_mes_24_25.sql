SELECT
    EXTRACT(MONTH FROM order_date) AS mes,

    ROUND(
        SUM(
            CASE
                WHEN EXTRACT(YEAR FROM order_date) = 2024
                THEN total_amount
                ELSE 0
            END
        ),
        2
    ) AS receita_2024,

    ROUND(
        SUM(
            CASE
                WHEN EXTRACT(YEAR FROM order_date) = 2025
                THEN total_amount
                ELSE 0
            END
        ),
        2
    ) AS receita_2025

FROM orders

WHERE status = 'delivered'
  AND order_date >= '2024-01-01'
  AND order_date < '2026-01-01'

GROUP BY
    EXTRACT(MONTH FROM order_date)

ORDER BY
    mes;