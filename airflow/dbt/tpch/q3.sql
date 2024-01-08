select l_orderkey,
       sum(l_extendedprice * (1 - l_discount)) as revenue,
       o_orderdate,
       o_shippriority
from parquet.`file:///dataset/tpch/sf1/customer/`,
     parquet.`file:///dataset/tpch/sf1/orders/`,
     parquet.`file:///dataset/tpch/sf1/lineitem/`
where c_mktsegment = 'BUILDING'
  and c_custkey = o_custkey
  and l_orderkey = o_orderkey
  and o_orderdate < date '1995-03-15'
  and l_shipdate > date '1995-03-15'
group by l_orderkey,
         o_orderdate,
         o_shippriority
order by revenue desc,
         o_orderdate,
         l_orderkey