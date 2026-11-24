-- Each customer should appear once in the customers model, so customer_id
-- should be unique. Return the customer_ids that appear more than once, which
-- makes the test fail.
select
    customer_id,
    count(*) as row_count
from {{ ref('dim_customers') }}
group by 1
having count(*) > 1
