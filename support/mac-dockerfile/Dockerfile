FROM ubuntu
 
MAINTAINER Oscar Leal "ozkralm10@hotmail.com"

RUN apt-get update

RUN apt-get install -y curl

# dependencies
# mongodb dependency



RUN apt-get install -y nodejs

RUN apt-get install -y apache2

RUN apt-get install -y default-jdk
RUN apt-get install -y default-jre


RUN cd /usr/ && mkdir local && cd ..
RUN cd /usr/local/ && mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew

RUN brew update
RUN brew install mongodb --devel
RUN mkdir -p /data/db       
RUN brew install node

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

