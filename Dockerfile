FROM apache/airflow:latest

USER root

RUN sudo apt-get update \
    && apt-get install -y gcc \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip \
    && pip install pandarallel \
    && pip install pyhive

USER airflow