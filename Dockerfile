FROM bdbstudios/base

ARG ANSIBLE_VERSION="2.9"
ARG PIP_PACKAGES="ansible==${ANSIBLE_VERSION} ansible-lint boto boto3 botocore pycrypto pywinrm requests"

USER root

# Install ansible
RUN apk update; \
    apk add python-dev py-setuptools build-base libffi-dev openssl-dev openssh-client; \
    pip install -U pip; \
    pip install -U ${PIP_PACKAGES}; \
    apk del python-dev build-base py-setuptools libffi-dev openssl-dev; \
    rm -rf ~/.cache ~/.gems; \
    rm -rf /var/cache/apk/*; \
    apk update

COPY docker/tests /home/tools/tests

VOLUME ["/home/tools/data", "/home/tools/.ssh"]

USER tools
WORKDIR /home/tools/data
