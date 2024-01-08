select p_brand,
       p_type,
       p_size,
       count(distinct ps_suppkey) as supplier_cnt
from parquet.`file:///dataset/tpch/sf1/partsupp/`,
     parquet.`file:///dataset/tpch/sf1/part/`
where p_partkey = ps_partkey
  and p_brand <> 'Brand#45'
  and p_type not like 'MEDIUM POLISHED%'
  and p_size in (49,
                 14,
                 23,
                 45,
                 19,
                 3,
                 36,
                 9)
  and ps_suppkey not in
    (select s_suppkey
     from parquet.`file:///dataset/tpch/sf1/supplier/`
     where s_comment like '%Customer%Complaints%' )
group by p_brand,
         p_type,
         p_size
order by supplier_cnt desc,
         p_brand,
         p_type,
         p_size