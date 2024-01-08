select c_count,
       count(*) as custdist
from
  (select c_custkey,
          count(o_orderkey) as c_count
   from parquet.`file:///dataset/tpch/sf1/customer/`
   left outer join parquet.`file:///dataset/tpch/sf1/orders/` on c_custkey = o_custkey
   and o_comment not like '%special%requests%'
   group by c_custkey) as c_orders
group by c_count
order by custdist desc,
         c_count desc