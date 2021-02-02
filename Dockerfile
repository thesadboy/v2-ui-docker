FROM centos:7
RUN yum update -y && yum install wget -y && wget https://blog.sprov.xyz/v2-ui.sh && bash ./v2-ui.sh && rm ./v2-ui.sh
EXPOSE 65432
CMD [ "/usr/sbin/init","-g","daemon off;" ]