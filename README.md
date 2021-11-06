SSH Reverse Tunneler Container
=============================

Container which runs SSH server and enables reverse TCP without authentication (i.e. no password, no pubkey).
The service is hardened not to allow anything but remote TCP forwarding.

## Build, run & create tunnel

```sh
## build
docker build -t sshrevtun .
## run
docker run -d --restart=unless-stopped -p 2022:22 sshrevtun
## create tunnel to localhost:12345
ssh  -R 0:0:localhost:12345 -T -N -p 2022 -l reverse-tunneler 127.0.0.1
```

