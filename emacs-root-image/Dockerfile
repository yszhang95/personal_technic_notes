FROM fedora:35

COPY packages packages

RUN dnf update -y \
 && dnf install -y $(cat packages) \
 && dnf install -y emacs \
 && rm /packages

ENTRYPOINT ["emacs"]
