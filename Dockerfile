FROM ubuntu:16.04
MAINTAINER ljm
#安装JDK
RUN mkdir /var/tmp/jdk
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie"  -P /var/tmp/jdk http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808/jdk-8u161-linux-x64.tar.gz
RUN tar xzf /var/tmp/jdk/jdk-8u161-linux-x64.tar.gz -C /var/java/jdk
RUN rm -rf /var/tmp/jdk/jdk-8u161-linux-x64.tar.gz

#安装maven
RUN mkdir /var/tmp/tomcat
RUN wget -P /var/tmp/tomcat http://apache.communilink.net/tomcat/tomcat-8/v8.0.50/bin/apache-tomcat-8.0.50.tar.gz
RUN tar xzf /var/tmp/tomcat/apache-tomcat-8.0.50.tar.gz -C /var/tomcat/tomcat
RUN rm -rf /var/tmp/tomcat/apache-tomcat-8.0.50.tar.gz

#设置环境变量
ENV JAVA_HOME /var/java/jdk/jdk1.8.0_161
ENV CATALINA_HOME /var/tomcat/tomcat/apache-tomcat-8.0.50
ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV CATALINA_BASE /var/tomcat/tomcat/apache-tomcat-8.0.50
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin:$CATALINA_HOME/lib

CMD ["./var/tomcat/tomcat/apache-tomcat-8.0.50/bin/startup.sh"]
