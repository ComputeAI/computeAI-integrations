WITH filtered_orders AS (
  SELECT
    l_orderkey,
    SUM(l_quantity) AS total_quantity
  FROM parquet.`file:///dataset/tpch/sf1/lineitem/`
  GROUP BY l_orderkey
  HAVING total_quantity > 300
)

SELECT
  c_name,
  c_custkey,
  o_orderkey,
  o_orderdate,
  o_totalprice,
  SUM(l_quantity) AS total_quantity
FROM parquet.`file:///dataset/tpch/sf1/customer/` c
JOIN parquet.`file:///dataset/tpch/sf1/orders/` o ON c.c_custkey = o.o_custkey
JOIN parquet.`file:///dataset/tpch/sf1/lineitem/` l ON o.o_orderkey = l.l_orderkey
JOIN filtered_orders fo ON o.o_orderkey = fo.l_orderkey
GROUP BY
  c_name,
  c_custkey,
  o_orderkey,
  o_orderdate,
  o_totalprice
ORDER BY
  o_totalprice DESC,
  o_orderdate
