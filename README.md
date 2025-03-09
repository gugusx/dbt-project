Setup in Source Server (in here, I'm using postgresql)
1. Create new DB and schema as data source (ddl.sql)
2. Create new table (ddl.sql)
3. Insert record using dml.sql
4. Create schema for DBT (Data Build Tool) using dbt_schema.sql


I'm using PostgreSQL container. Here the setup.
Setup for PostgreSQL Container
1. Pull from https://hub.docker.com/, I'm using version 12
![alt text](<Screenshot from 2025-03-09 16-38-53.png>)


Setup for DBT
I'm using virtual environment to install DBT
1. Create Python new virtual environemnt: python3 -m venv dbt-env
2. Activate Virtual Environment: source dbt-env/bin/activate
3. Install DBT libraries: 
    - pip3 install dbt-core
    - pip3 install dbt-postgres
