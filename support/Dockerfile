FROM ubuntu
 
MAINTAINER Oscar Leal "ozkralm10@hotmail.com"


RUN apt-get update

RUN apt-get install -y curl

# dependencies
# mongodb dependency

#RUN tar -zxvf mongodb-osx-ssl-x86_64-3.6.0.tgz
#RUN mkdir -p mongodb
#RUN cp -R -n mongodb-osx-ssl-x86_64-3.6.0/ mongodb
#RUN export PATH=<mongodb-install-directory>/bin:$PATH
#RUN brew update
#RUN brew install mongodb --devel
#RUN mkdir -p /data/db       
#RUN brew install node


RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
RUN echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list
RUN apt-get install -y mongodb-server  
RUN mkdir -p /data/db/
RUN chown `id -u` /data/db
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

RUN apt-get install -y apache2

RUN apt-get install -y default-jdk
RUN apt-get install -y default-jre

ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk/jre
ENV PATH $PATH:/usr/lib/jvm/java-1.8.0-openjdk/jre/bin:/usr/lib/jvm/java-1.8.0-openjdk/bin
RUN java -version
RUN apt-get install -y maven
ENV NVM_DIR /usr/local/mvn

RUN apt-get install -y build-essential
RUN apt-get install -y python

ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-amd64/jre
ENV PATH $PATH:/usr/lib/jvm/java-1.8.0-openjdk-amd64/jre/bin:/usr/lib/jvm/java-1.8.0-openjdk-amd64/bin
RUN mvn -v

# copy gits one by one to image
COPY api-gateway /api-gateway
COPY auth-user-management /auth-user-management
############################ COPY front-end /front-end
COPY front-end /var/www/html/
COPY game-engine /game-engine
COPY highscores /highscores

RUN cd /auth-user-management/auth_user_management && npm install
RUN cd /api-gateway/api_gateway/ && npm install
RUN cd /game-engine/ && mvn clean package
RUN cd /highscores/highscores/ && npm install

EXPOSE 80 3334

COPY initreposcripts.sh /initreposcripts.sh
RUN chmod +x /initreposcripts.sh

ENTRYPOINT ["bin/bash", "/initreposcripts.sh"]

