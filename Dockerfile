FROM python:3.6-slim-stretch
MAINTAINER Alex Paul

RUN apt-get update && apt-get -y dist-upgrade

RUN apt-get install -y libopenjp2-7-dev libmagic1 build-essential wget && \
    apt-get clean -y && \
    apt-get autoremove -y

ADD virenv /tmp

RUN tar -xzvpf /tmp/virtualenv-15.0.0.tar.gz -C /tmp && \
    python /tmp/virtualenv-15.0.0/virtualenv.py /opt/v
#    rm -rf /tmp/virtualenv-15.0.0

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    zip

RUN /opt/v/bin/pip install pyyaml

CMD ["/bin/bash"]
