FROM mysql AS img_mysql
ENV MY_SQL_ROOT_PASSWORD=root
COPY database_demo.sql /docker-entrypoint-initdb.d/




FROM ubuntu:22.04 AS img_java_fetch

RUN apt update
RUN apt install -y default-jdk
RUN mkdir -p "/home/demo"
COPY . "/home/demo"
WORKDIR /home/demo
RUN dpkg -i mysql-connector-j_8.0.32-1ubuntu22.04_all.deb
RUN pwd
RUN ls
RUN javac MysqlCon.java
ENTRYPOINT ["java", "-cp"]
CMD [".:mysql-connector-j-8.0.32.jar","MysqlCon"]

