# Write your MySQL query statement below
WITH FirstOrders AS (
    -- This CTE finds the earliest (first) order for each customer.
    SELECT 
        customer_id,
        MIN(order_date) AS first_order_date
    FROM 
        Delivery
    GROUP BY 
        customer_id
),

ImmediateFirstOrders AS (
    -- This CTE identifies whether the first order was an immediate order.
    SELECT 
        d.customer_id,
        (CASE WHEN d.order_date = d.customer_pref_delivery_date THEN 1 ELSE 0 END) AS is_immediate
    FROM 
        Delivery d
    JOIN 
        FirstOrders fo ON d.customer_id = fo.customer_id AND d.order_date = fo.first_order_date
)

-- Calculate the percentage of immediate first orders.
SELECT 
    ROUND(SUM(is_immediate) * 100.0 / COUNT(*), 2) AS immediate_percentage
FROM 
    ImmediateFirstOrders;
