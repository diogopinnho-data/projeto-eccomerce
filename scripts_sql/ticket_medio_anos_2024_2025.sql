SELECT
    EXTRACT(MONTH FROM order_date) AS mes,

    ROUND(
        AVG(total_amount) FILTER (
            WHERE EXTRACT(YEAR FROM order_date) = 2024
        ),
        2
    ) AS ticket_medio_2024,

    ROUND(
        AVG(total_amount) FILTER (
            WHERE EXTRACT(YEAR FROM order_date) = 2025
        ),
        2
    ) AS ticket_medio_2025

FROM orders

WHERE status = 'delivered'
  AND EXTRACT(YEAR FROM order_date) IN (2024, 2025)

GROUP BY
    EXTRACT(MONTH FROM order_date)

ORDER BY
    mes;