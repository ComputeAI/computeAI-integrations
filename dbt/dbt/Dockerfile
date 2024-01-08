FROM python:3.11

RUN apt-get update \
    && apt-get install autoconf automake build-essential libssl-dev vim -y

# Create a virtual environment for isolated dependencies
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN pip install dbt-spark dbt-spark[PyHive]

ADD setup-dbt.sh /setup-dbt.sh

RUN chmod a+x /setup-dbt.sh

ENTRYPOINT /setup-dbt.sh
