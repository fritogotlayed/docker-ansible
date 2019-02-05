FROM alpine:3.8

ENV ANSIBLE_VERSION 2.7.0

RUN set -x && \
    \
    echo "==> Upgrading apk and system..."  && \
    apk update && apk upgrade && \
    \
    echo "==> Adding build-dependencies..."  && \
    apk --update add --virtual build-dependencies \
        gcc \
        musl-dev \
        libffi-dev \
        openssl-dev \
        python3-dev \
        make && \
    \
    echo "Installing bash" && \
    apk add --no-cache bash && \
    echo "Installing python3 and pip3..." && \
    apk add --no-cache python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache && \
    \
    echo "==> Installing Ansible..."  && \
    pip3 install ansible==${ANSIBLE_VERSION} && \
    \
    echo "==> Cleaning up..."  && \
    apk del build-dependencies && \
    rm -rf /var/cache/apk/* && \
    \
    echo "==> Adding hosts for convenience..."  && \
    mkdir -p /etc/ansible /ansible && \
    echo "[local]" >> /etc/ansible/hosts && \
    echo "localhost" >> /etc/ansible/hosts

LABEL Maintainer="Frito" \
    Website="https://github.com/fritogotlayed/docker-ansible" \
    "Build website"="https://travis-ci.org/fritogotlayed/docker-ansible"

CMD [ "echo", "please enter a command" ]
