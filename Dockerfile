FROM apache/airflow:2.9.3

USER root
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
         gcc \
         heimdal-dev \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
USER airflow
RUN pip install --no-cache-dir apache-airflow-providers-apache-spark
RUN pip install --no-cache-dir oracledb
RUN pip install --no-cache-dir apache-airflow-providers-common-sql
RUN pip install --no-cache-dir apache-airflow-providers-oracle
RUN pip install krb5
RUN pip install apache-airflow-providers-apache-hdfs
RUN pip install --no-cache-dir apache-airflow-providers-jdbc
RUN pip install --no-cache-dir apache-airflow-providers-telegram
RUN pip install --no-cache-dir apache-airflow-providers-apache-kafka
