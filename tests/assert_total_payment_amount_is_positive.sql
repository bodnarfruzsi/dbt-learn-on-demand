-- Orders without a successful payment have an amount of 0, so the total amount
-- should never be negative. Return the orders where this isn't true, which makes
-- the test fail.
select
    order_id,
    sum(amount) as total_amount
from {{ ref('fct_orders') }}
group by 1
having not(total_amount >= 0)
