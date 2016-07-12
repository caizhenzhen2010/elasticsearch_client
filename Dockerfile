#pull form the baseimage
FROM sean2016/java-8u91

MAINTAINER sean "caizhenzhen2010@sina.com"

#更新软件版本
RUN apt-get update

#安装wget
RUN yum install wget

#变更目录
WORKDIR /opt

#下载 elasticsearch
wget https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.3.4/elasticsearch-2.3.4.tar.gz

#解压
RUN tar zxvf elasticsearch-2.3.4.tar.gz

#进入es目录
WORKDIR /opt/elasticsearch-2.3.4/config
