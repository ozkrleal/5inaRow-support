FROM ubuntu
 
MAINTAINER Oscar Leal "ozkralm10@hotmail.com"


# dependencies
# mongodb dependency
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
RUN echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list
RUN apt-get update

RUN apt-get install -y mongodb-server  

RUN apt-get install -y linuxbrew-wrapper

#RUN apt-get install -y nodejs
#RUN apt-get install -y npm

RUN apt-get install -y default-jre
#OR  #ENV JAVA_HOME /usr/lib/jvm/java-8-oracle/bin
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64/bin
RUN java -version

RUN apt-get install -y maven
#RUN mvn -version

ENV NVM_DIR /usr/local/mvn
ENV NODE_VERSION 0.10.33

RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.20.0/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/v$NODE_VERSION/bin:$PATH

# copy gits one by one to image
COPY api-gateway /api-gateway
COPY auth-user-management /auth-user-management
COPY front-end /front-end
COPY game-engine /game-engine
COPY highscores /highscores

# run/create mongo db
RUN mkdir -p /data/db/
RUN chown `id -u` /data/db
RUN service mongodb start
#RUN mongod --config /etc/mongod.conf


#brew error:  update   PATH, MANPATH, INFOPATH 
#RUN brew update
#RUN brew install gradle
#RUN brew install maven
##RUN mvn -version

RUN cd /auth-user-management/auth_user_management && npm install
RUN cd /api-gateway/api_gateway/ && npm install
RUN cd /game-engine/ && mvn -f pom.xml


# config mongodb?
# config webserver nodejs?

COPY initreposcripts.sh /initreposcripts.sh
# RUN scripts to start services
RUN chmod +x /initreposcripts.sh

#todo: script that calls scripts in each submodule
ENTRYPOINT ["bin/bash", "/initreposcripts.sh"]

