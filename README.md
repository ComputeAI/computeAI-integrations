<div align="center">
  <img src="https://github.com/ComputeAI/computeAI-integrations/blob/main/logo/ComputeAI-Logo.png" height="100">
</div>
<br>

<p align="center">
  <a href="https://discord.gg/wemNjP3tUd">
    <img src="https://shields.io/discord/909674491309850675" alt="discord" />
  </a>
</p>


# ComputeAI

In this repo, we have provided a containerized deployment of the ComputeAI SQL engine.

ComputeAI containers work on most versions of Linux including Canonical Ubuntu 22.04 LTS, AmazonLinux 2.

Please note, this is just a single node containerized deployment. If you'd like to play with our elastic cluster, please email us at contact@compute.ai and we'd be happy to help.

## Quick Start

- [ComputeAI with Jupyter Notebook](https://github.com/ComputeAI/computeAI-integrations/tree/main/jupyter/README.md)
- [ComputeAI with Superset](https://github.com/ComputeAI/computeAI-integrations/tree/main/superset/README.md)
- [ComputeAI with DBT](https://github.com/ComputeAI/computeAI-integrations/tree/main/dbt/README.md)
- [ComputeAI with Airflow](https://github.com/ComputeAI/computeAI-integrations/tree/main/airflow/README.md)
- [ComputeAI with MinIO](https://github.com/ComputeAI/computeAI-integrations/tree/main/minio/README.md)
- [ComputeAI with HDFS](https://github.com/ComputeAI/computeAI-integrations/tree/main/hdfs/README.md)
- [ComputeAI with Qlik](https://github.com/ComputeAI/computeAI-integrations/tree/main/qlik/README.md)

## ComputeAI in a nutshell

ComputeAI's creates immense value in the open Spark SQL ecosystem to create unlimited concurrency at high performance, reliability, and efficiency while reducing cloud infrastructure cost by ~5x.

Value prop:
- Massive concurrency with unlimited users/queries
- Extreme reliability (no OOM-kills)
- Multi-cloud (AWS, Azure, GCP), hybrid, and on-premises
- High level of cloud security with enterprise grade SLAs
- 100% open standards (Parquet, Iceberg)
- Cluster up and running in less than a few minutes
- No touch, requires no management or tuning 

Simply download the container, develop using GBs of data, and run 1000s of concurrent jobs with TBs of data. There is no management or tuning needed. ComputeAI runs reliably and unattended like an OS.

## Notes

We currently do not support IMDSv2. As a result, when configuring AWS instances, it's crucial to set IMDSv2 as "optional." This ensures that the application can access Amazon S3 services without issues. We are aware of the importance and benefits of IMDSv2 and are actively working to update our application for compatibility. Until then, please ensure that your AWS instance metadata settings are appropriately configured (as shown below).


<img width="663" alt="Screenshot 2024-03-07 at 2 18 18 PM" src="https://github.com/ComputeAI/computeAI-integrations/assets/76465839/eff0f0e6-f46b-4d05-aeef-3706d565b0c0">


## Join the ComputeAI Community

- Be part of the conversation in the [ComputeAI Community Discord](https://discord.gg/wemNjP3tUd)
- [Check out our YouTube channel!](https://www.youtube.com/@ComputeA.I.)

## Reporting bugs and contributing code

- Want to report a bug or request a feature? Let us know on [Discord](https://discord.gg/wemNjP3tUd), or open [an issue](https://github.com/ComputeAI/computeAI-integrations/issues/new)

## Contact Us

To find out more, please check out our website at https://compute.ai/

If you like the sound of this and are interested in joining our team, please reach out to us at contact@compute.ai. We'd love to chat! We're a small team of 4 developers and always looking to work with other talented and fun people.

Lastly, if something doesn't work or if you have any questions, please email us at contact@compute.ai. We are more than happy to help.
