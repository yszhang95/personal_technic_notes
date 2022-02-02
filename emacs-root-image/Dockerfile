FROM fedora:35

COPY packages packages

RUN dnf update -y \
 && dnf install -y $(cat packages) \
 && dnf install -y emacs \
 && dnf install -y ripgrep \
 && rm /packages

ENTRYPOINT ["emacs"]
