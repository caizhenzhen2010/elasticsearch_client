#pull form the baseimage
FROM sean2016/java-8u91

MAINTAINER sean "caizhenzhen2010@sina.com"

#更新软件版本
RUN yum update -y
 
#安装wget
RUN yum install -y wget

#变更目录
WORKDIR /opt

#下载 elasticsearch
RUN wget https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.3.4/elasticsearch-2.3.4.tar.gz

#解压
RUN tar zxvf elasticsearch-2.3.4.tar.gz

#删除elasticsearch-2.3.4.tar.gz
RUN rm -rf elasticsearch-2.3.4.tar.gz

#进入es目录
WORKDIR /opt/elasticsearch-2.3.4/config

#删除elasticsearch.yml
RUN mv -rf elasticsearch.yml

#下载client的配置文件
RUN wget https://github.com/caizhenzhen2010/elasticsearch_client/blob/master/elasticsearch.yml

#绑定端口
EXPOSE 9200 9300

#挂载目录
VOLUME ["/var/logs/elasticsearch/data","/var/logs/elasticsearch/log"]

#启动container之前执行的命令；是启动elasticsearch
ENTRYPOINT ["/var/logs/elasticsearch/log/elasticsearch"]
