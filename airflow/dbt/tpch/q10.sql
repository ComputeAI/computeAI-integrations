select c_custkey,
       c_name,
       cast(sum(l_extendedprice * (1 - l_discount)) as decimal(15, 4)) as revenue,
       c_acctbal,
       n_name,
       c_address,
       c_phone,
       c_comment
from parquet.`file:///dataset/tpch/sf1/customer/`,
     parquet.`file:///dataset/tpch/sf1/orders/`,
     parquet.`file:///dataset/tpch/sf1/lineitem/`,
     parquet.`file:///dataset/tpch/sf1/nation/`
where c_custkey = o_custkey
  and l_orderkey = o_orderkey
  and o_orderdate >= date '1993-10-01'
  and o_orderdate < date '1993-10-01' + interval '3' month
  and l_returnflag = 'R'
  and c_nationkey = n_nationkey
group by c_custkey,
         c_name,
         c_acctbal,
         c_phone,
         n_name,
         c_address,
         c_comment
order by revenue desc,
         c_custkey