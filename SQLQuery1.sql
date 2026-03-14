ALTER VIEW vw_olist AS
SELECT 
    t1.order_id,
    t1.order_status,
    t1.order_delivered_customer_date,
    t1.order_estimated_delivery_date,
    DATEDIFF(DAY, t1.order_estimated_delivery_date, t1.order_delivered_customer_date) AS dias_atraso,
    
    CASE 
        WHEN DATEDIFF(DAY, t1.order_estimated_delivery_date, t1.order_delivered_customer_date) > 0 THEN 'Atrasado'
        ELSE 'No Prazo'
    END AS status_entrega,

    t2.review_score,
    t3.price,
    t3.freight_value,
    ISNULL(t4.product_category_name, 'não informado') AS categoria_produto,
    -- Nova coluna adicionada:
    t5.customer_state
    
FROM olist_orders_dataset AS t1
LEFT JOIN olist_order_reviews_dataset AS t2 ON t1.order_id = t2.order_id
LEFT JOIN olist_order_items_dataset AS t3 ON t1.order_id = t3.order_id
LEFT JOIN olist_products_dataset AS t4 ON t3.product_id = t4.product_id
-- Novo JOIN para trazer o estado:
LEFT JOIN olist_customers_dataset AS t5 ON t1.customer_id = t5.customer_id
WHERE t1.order_status = 'delivered'
  AND t2.review_score IS NOT NULL;