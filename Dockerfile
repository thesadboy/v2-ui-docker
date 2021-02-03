FROM centos:7
ENV SHELL /bin/bash
ADD systemctl /usr/bin/systemctl-fake
RUN yum update -y && yum install wget gcc -y && curl https://raw.githubusercontent.com/daleobrien/start-stop-daemon/master/start-stop-daemon.c > start-stop-daemon.c \
    &&  gcc start-stop-daemon.c -o start-stop-daemon \
    &&  mv start-stop-daemon /usr/bin/start-stop-daemon && mv /usr/bin/systemctl /usr/bin/systemctl.real \
    && mv /usr/bin/systemctl-fake /usr/bin/systemctl && chmod 775 /usr/bin/systemctl && yum clean all && wget https://raw.githubusercontent.com/sprov065/v2-ui/master/install.sh --no-check-certificate && bash ./install.sh && rm ./install.sh
EXPOSE 65432
CMD v2-ui start || echo '' && tail -f /dev/null