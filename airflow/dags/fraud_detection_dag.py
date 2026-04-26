from datetime import datetime
from airflow import DAG
from airflow.operators.bash import BashOperator

DBT_PROJECT_PATH = "/opt/airflow/dbt_project"

with DAG(
    dag_id="fraud_detection_snowflake_dbt_pipeline",
    description="Orchestrates Snowflake + dbt fraud detection pipeline",
    start_date=datetime(2024, 1, 1),
    schedule="@daily",
    catchup=False,
    tags=["snowflake", "dbt", "fraud-detection"],
) as dag:

    dbt_debug = BashOperator(
        task_id="dbt_debug",
        bash_command=f"cd {DBT_PROJECT_PATH} && dbt debug",
    )

    dbt_run = BashOperator(
        task_id="dbt_run",
        bash_command=f"cd {DBT_PROJECT_PATH} && dbt run",
    )

    dbt_test = BashOperator(
        task_id="dbt_test",
        bash_command=f"cd {DBT_PROJECT_PATH} && dbt test",
    )

    dbt_debug >> dbt_run >> dbt_test