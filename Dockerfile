FROM tutum/centos:centos6

MAINTAINER San

EXPOSE 80 
EXPOSE 21 
EXPOSE 22 
EXPOSE 443

ENV ROOT_PASS lnmp123

# centos
RUN yum -y install wget 

# install lnmp
RUN wget http://soft.vpser.net/lnmp/lnmp1.3.tar.gz && tar -xvf ./lnmp1.3.tar.gz \
RUN cd lnmp1.3 && wget https://raw.githubusercontent.com/c21xdx/lnmp13/master/install.conf && cat install.conf | ./install.sh \
RUN cd ../ && rm -rf lnmp1.3.tar.gz lnmp1.3 \

# set lnmp start
RUN wget https://raw.githubusercontent.com/c21xdx/lnmp13/master/lnmp.sh -O /etc/my_init.d/lnmp.sh \
RUN chmod +x /etc/my_init.d/lnmp.sh
