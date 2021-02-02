FROM centos:7
RUN yum update -y && yum install wget -y && wget https://raw.githubusercontent.com/sprov065/v2-ui/master/install.sh --no-check-certificate && bash ./v2-ui.sh && rm ./v2-ui.sh
EXPOSE 65432
CMD [ "/usr/sbin/init","-g","daemon off;" ]