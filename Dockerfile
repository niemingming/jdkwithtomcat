FROM ubuntu:16.04
MAINTAINER nmm
#安装JDK
#RUN mkdir -p /var/java
#RUN wget -P /var/java http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808/jdk-8u161-linux-x64.tar.gz
#RUN tar xzf /var/java/jdk-8u161-linux-x64.tar.gz -C /var/java
#RUN rm -rf /var/java/jdk/jdk-8u161-linux-x64.tar.gz
#本地已经下载了
ADD /mnt/sda1/java/jdk-8u161-linux-x64.tar.gz /var/java
#安装maven
#RUN mkdir /var/tomcat
ADD /mnt/sda1/tomcat/apache-tomcat-8.0.50.tar.gz /var/tomcat
#RUN wget -P /var/tomcat http://apache.communilink.net/tomcat/tomcat-8/v8.0.50/bin/apache-tomcat-8.0.50.tar.gz
#RUN tar xzf /var/tomcat/apache-tomcat-8.0.50.tar.gz -C /var/tomcat
#RUN rm -rf /var/tomcat/apache-tomcat-8.0.50.tar.gz

#设置环境变量
ENV JAVA_HOME /var/java/jdk1.8.0_161
ENV CATALINA_HOME /var/tomcat/apache-tomcat-8.0.50
ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV CATALINA_BASE /var/tomcat/apache-tomcat-8.0.50
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin:$CATALINA_HOME/lib

CMD ["./var/tomcat/apache-tomcat-8.0.50/bin/startup.sh"]
