FROM centos
ENV SHELL /bin/bash
ADD systemctl /usr/bin/systemctl-fake
ADD start-stop-daemon /usr/bin/start-stop-daemon
RUN yum install wget -y \
    && mv /usr/bin/systemctl /usr/bin/systemctl.real \
    && mv /usr/bin/systemctl-fake /usr/bin/systemctl \
    && chmod 775 /usr/bin/systemctl && chmod 775 /usr/bin/start-stop-daemon && yum clean all \
    && wget https://raw.githubusercontent.com/sprov065/v2-ui/master/install.sh --no-check-certificate \
    && bash ./install.sh && rm ./install.sh
EXPOSE 65432
CMD v2-ui start || echo '' && tail -f /dev/null