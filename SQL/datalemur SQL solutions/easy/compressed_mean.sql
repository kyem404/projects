select round(mean::decimal,1)
from
(
SELECT (sum(order_occurrences * item_count) / sum(order_occurrences))
as mean
FROM items_per_order
) as figure;
