select l_returnflag,
       l_linestatus,
       sum(l_quantity) as sum_qty,
       sum(l_extendedprice) as sum_base_price,
       sum(l_extendedprice * (1 - l_discount)) as sum_disc_price,
       sum(l_extendedprice * (1 - l_discount) * (1 + l_tax)) as sum_charge,
       avg(l_quantity) as avg_qty,
       avg(l_extendedprice) as avg_price,
       avg(l_discount) as avg_disc,
       count(*) as count_order
From parquet.`file:///dataset/tpch/sf1/lineitem/`
where l_shipdate <= date '1998-12-01' - interval '90' day
group by l_returnflag,
         l_linestatus
order by l_returnflag,
         L_linestatus;