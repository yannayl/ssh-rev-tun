from alpine:3.14

ARG USERNAME=reverse-tunneler

RUN apk add --no-cache --upgrade openssh-server-pam
RUN ssh-keygen -A -t rsa -b 2048
COPY sshd_config /etc/ssh/sshd_config
COPY sshd.pam    /etc/pam.d/sshd.pam
## Create locked user account with blank passowrd
RUN adduser -s /bin/false -k /dev/null -D "${USERNAME}"
## Unlock the account
RUN passwd -u "${USERNAME}"
EXPOSE 2022
CMD ["/usr/sbin/sshd.pam", "-D"]
