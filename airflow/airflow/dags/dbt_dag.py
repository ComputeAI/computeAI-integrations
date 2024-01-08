from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime, timedelta  # Ensure timedelta is imported

with DAG(
        dag_id="dbt_dag",
        start_date=datetime(2024, 1, 1),  # Adjust start date as needed
        schedule_interval=timedelta(seconds=60),  # Schedule every 60 seconds
        catchup=False,
        ) as dag:
    dbt_run = BashOperator(
            task_id="run_dbt",
            bash_command="dbt run -s tpch")
