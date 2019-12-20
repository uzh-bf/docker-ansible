# adapted from https://github.com/William-Yeh/docker-ansible/blob/master/alpine3/Dockerfile

FROM alpine:3.11.0

RUN apk --update add sudo && \
  apk --update add python3 openssl ca-certificates terraform git && \
  apk --update add --virtual build-dependencies python3-dev libffi-dev openssl-dev build-base && \
  python3 -m ensurepip && \
  pip3 install --no-cache --upgrade pip setuptools wheel cffi && \
  pip3 install --no-cache ansible && \
  pip3 install --no-cache --upgrade pycrypto pywinrm && \
  apk del build-dependencies && \
  rm -rf /var/cache/apk/* && \
  mkdir -p /etc/ansible && \
  echo 'localhost' > /etc/ansible/hosts

CMD [ "ansible-playbook", "--version" ]
