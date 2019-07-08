# adapted from https://github.com/William-Yeh/docker-ansible/blob/master/alpine3/Dockerfile

FROM alpine:3.10

RUN apk --update add sudo && \
  apk --update add python3 openssl ca-certificates terraform && \
  apk --update add --virtual build-dependencies python3-dev libffi-dev openssl-dev build-base && \
  python3 -m ensurepip && \
  pip3 install --upgrade pip cffi && \
  pip3 install ansible && \
  pip3 install --upgrade pycrypto pywinrm && \
  apk del build-dependencies && \
  rm -rf /var/cache/apk/* && \
  mkdir -p /etc/ansible && \
  echo 'localhost' > /etc/ansible/hosts

CMD [ "ansible-playbook", "--version" ]
