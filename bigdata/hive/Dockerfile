FROM liufree/hadoop:latest

LABEL Wenxiang Liu <liufreeo@gmail.com>

ADD install.sh /opt
RUN ["sh", "/opt/install.sh"]

COPY configs/core-site.xml /etc/hadoop/core-site.xml
COPY configs/hive-env.sh  /etc/hive/hive-env.sh
COPY configs/hive-site.xml /etc/hive/hive-site.xml
