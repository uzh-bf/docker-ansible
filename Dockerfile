# adapted from https://github.com/William-Yeh/docker-ansible/blob/master/alpine3/Dockerfile

FROM alpine:3.10

RUN apk --update add sudo && \
  apk --update add python py-pip openssl ca-certificates && \
  apk --update add --virtual build-dependencies libffi-dev openssl-dev build-base && \
  pip install --upgrade pip cffi && \
  pip install ansible terraform && \
  pip install --upgrade pycrypto pywinrm && \
  apk --update add sshpass openssh-client rsync && \
  apk del build-dependencies && \
  rm -rf /var/cache/apk/* && \
  mkdir -p /etc/ansible && \
  echo 'localhost' > /etc/ansible/hosts

CMD [ "ansible-playbook", "--version" ]
