# ubuntu 20.04.5 LTS (Focal Fossa) - end support 2030.
FROM ubuntu@sha256:9fa30fcef427e5e88c76bc41ad37b7cc573e1d79cecb23035e413c4be6e476ab

COPY requirements/* /opt/tmp/

ARG INSTANT_CLIENT="https://download.oracle.com/otn_software/linux/instantclient/219000/instantclient-basiclite-linux.x64-21.9.0.0.0dbru.zip"
ARG TERRAFORM="https://releases.hashicorp.com/terraform/1.3.9/terraform_1.3.9_linux_amd64.zip"
ARG DEBIAN_FRONTEND="noninteractive"

# to proxy, set the following build args
#ARG http_proxy="http://xxxxxx.xxxx.xxxxx:3128"
#ARG https_proxy="http://xxxxxx.xxxx.xxxxx:3128"
#ARG no_proxy=".xxxxx.xxx"

ENV PATH="/root/bin:${PATH}" \
    LD_LIBRARY_PATH="/opt/instant-client" \
    PIP_ROOT_USER_ACTION="ignore"

WORKDIR /tmp/oci-cli

RUN apt-get update && \
    xargs -a /opt/tmp/_apt.txt apt-get install -yqq --no-install-recommends && \
    pip install -q --no-cache-dir --upgrade pip==23.0.1 && \
    pip install -q --no-cache-dir -r /opt/tmp/_pip.txt && \
    ansible-galaxy collection install -r /opt/tmp/galaxy.yml && \
    curl -sL ${INSTANT_CLIENT} -o /opt/tmp/instant-client.zip && \
    curl -sL ${TERRAFORM} -o /opt/tmp/terraform.zip && \
    unzip -j /opt/tmp/instant-client.zip -d /opt/instant-client && \
    unzip /opt/tmp/terraform.zip -d /usr/local/bin/ && \
    chmod +x /usr/local/bin/terraform && \
    mkdir /root/.oci/ && \
    mv /opt/tmp/config /root/.oci/ && \
    rm -rf /opt/tmp/ var/lib/apt/lists/* /root/.cache/pip && \
    apt-get clean
