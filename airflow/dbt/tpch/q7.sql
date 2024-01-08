select supp_nation,
       cust_nation,
       l_year,
       sum(volume) as revenue
from
  (select n1.n_name as supp_nation,
          n2.n_name as cust_nation,
          year(l_shipdate) as l_year,
          l_extendedprice * (1 - l_discount) as volume
   from parquet.`file:///dataset/tpch/sf1/supplier/`,
        parquet.`file:///dataset/tpch/sf1/lineitem/`,
        parquet.`file:///dataset/tpch/sf1/orders/`,
        parquet.`file:///dataset/tpch/sf1/customer/`,
        parquet.`file:///dataset/tpch/sf1/nation/` n1,
        parquet.`file:///dataset/tpch/sf1/nation/` n2
   where s_suppkey = l_suppkey
     and o_orderkey = l_orderkey
     and c_custkey = o_custkey
     and s_nationkey = n1.n_nationkey
     and c_nationkey = n2.n_nationkey
     and ((n1.n_name = 'FRANCE'
           and n2.n_name = 'GERMANY')
          or (n1.n_name = 'GERMANY'
              and n2.n_name = 'FRANCE'))
     and l_shipdate between date '1995-01-01' and date '1996-12-31' ) as shipping
group by supp_nation,
         cust_nation,
         l_year
order by supp_nation,
         cust_nation,
         l_year