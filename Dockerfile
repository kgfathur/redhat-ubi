ARG TAG=latest
FROM registry.access.redhat.com/ubi8/ubi:$TAG

LABEL maintainer="kgfathur" \
      name="rhubi" \
      version="8.3" \
      description="Red Hat Universal Base Image 8 with some additional package" \
      Copyright="Red Hat Universal Base Image 8 (c) Red Hat, Inc." \
      License="GPLv3"

COPY src /tmp/src

RUN chmod +x /tmp/src/add-pkg.sh \
&& /tmp/src/add-pkg.sh \
&& rm -rf /tmp/src \
&& rm -rf /var/log/*

CMD [ "/bin/sh"]
