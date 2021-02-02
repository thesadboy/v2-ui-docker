FROM centos:7
RUN yum update -y && yum install wget -y && wget https://raw.githubusercontent.com/sprov065/v2-ui/master/install.sh --no-check-certificate && bash ./install.sh && rm ./install.sh
EXPOSE 65432
CMD [ "/usr/sbin/init","-g","daemon off;" ]