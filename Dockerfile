# Airflow Docker Image - Modify
# Added: python-dev, libsasl2-dev, gcc and g++
# Added: pandarallel, pyhive, scikit-learn and their dependencies
# Author: Mario Medone

# From the latest version of apache/airflow
FROM apache/airflow:latest

# Switch to user root privileges to install system packages
USER root

# Update existing packages
# Install python-dev, libsasl2-dev, gcc and g++ to run correctly sasl 
RUN sudo apt-get update \
    && apt-get install -y python-dev \
    && apt-get install -y libsasl2-dev \
    && apt-get install -y gcc \
    && apt-get install -y g++ \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Switch to user airflow privileges to install python packages via pip
USER airflow

# Upgrade pip
# Install the latest version of pandarallel, pyhive, scikit-learn and their dependencies
RUN pip install --upgrade pip \
    && pip install pandarallel \
    && pip install pyhive \
    && pip install thrift \
    && pip install sasl \
    && pip install thrift_sasl \
    && pip install scikit-learn

# Image ready to be used!

# EOF #
