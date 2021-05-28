FROM apache/airflow:latest

USER root

RUN sudo apt-get update \
    && apt-get install -y python-dev \
    && apt-get install -y libsasl2-dev \
    && apt-get install -y gcc \
    && apt-get install -y g++ \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER airflow

RUN pip install --upgrade pip \
    && pip install pandarallel \
    && pip install pyhive \
    && pip install thrift \
    && pip install sasl \
    && pip install thrift_sasl