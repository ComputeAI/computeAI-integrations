# ML Training with Memory Overcommit demo

Here is a short demo of ML Training with Memory Overcommit.

<div align="left">
      <a href="https://www.youtube.com/watch?v=kNOsgbVeMV0">
         <img src="https://img.youtube.com/vi/kNOsgbVeMV0/0.jpg" style="width:50%;">
      </a>
</div>

## Overcommit calculation

- Here is the demo SQL on SF1000 TPCH parquet dataset on S3.

```{bash}
SELECT o.o_orderdate, SUM(l.l_quantity) as total_quantity, AVG(l.l_quantity) as avg_quantity, SUM(l.l_extendedprice) as total_price
FROM parquet.`s3a://jitsu-test-data-east/tpch/sf1000/parquet/partitioned/customer` c
JOIN parquet.`s3a://jitsu-test-data-east/tpch/sf1000/parquet/partitioned/orders` o ON c.c_custkey = o.o_custkey
JOIN parquet.`s3a://jitsu-test-data-east/tpch/sf1000/parquet/partitioned/lineitem` l ON o.o_orderkey = l.l_orderkey
GROUP BY o.o_orderdate
```

- Here is the rundown of the calculation of overcommit here for the above query.
  - Customer Table: 1.5B records, 269GB
  - Orders Table: 150M records, 13.7GB
  - Customer and Orders joined (Join-1) Table: 1.5B records, 67GB
  - Lineitem Table: 6B records, 1073GB
  - Lineitem and Join-1 joined (Join-2) Table: 6B records, 1065TB
  - Available Memory: 9.62GB
  - Overcommit ratio: Join-1 Table + Lineitem Table + Join-2 Table = 2205GB / 9.62GB = 229X
