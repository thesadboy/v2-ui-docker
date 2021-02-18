FROM jrei/systemd-debian
ENV SHELL /bin/bash
RUN apt-get update \
    && apt-get install -y wget procps \
    && wget https://raw.githubusercontent.com/sprov065/v2-ui/master/install.sh --no-check-certificate \
    && bash ./install.sh \
    && rm ./install.sh \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
EXPOSE 65432