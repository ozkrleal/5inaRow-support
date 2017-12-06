FROM ubuntu
 
MAINTAINER Oscar Leal "ozkralm10@hotmail.com"


# dependencies
# mongodb dependency
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
RUN echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list
RUN apt-get update

RUN apt-get install -y mongodb-server  

RUN apt-get install -y curl

RUN apt-get install -y apache2

#RUN apt-get install -y linuxbrew-wrapper
#RUN apt-get install -y nodejs
#RUN apt-get install -y npm

RUN apt-get install -y default-jdk
RUN apt-get install -y default-jre
#OR  #ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
#OR ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
#ENV JAVA_HOME /usr/lib/jvm/open-jdk
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk/jre
ENV PATH $PATH:/usr/lib/jvm/java-1.8.0-openjdk/jre/bin:/usr/lib/jvm/java-1.8.0-openjdk/bin


RUN java -version

RUN apt-get install -y maven

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
############################ COPY front-end /front-end
COPY front-end /var/www/html/
COPY game-engine /game-engine
COPY highscores /highscores

RUN service apache2 start

RUN apt-get install -y build-essential checkinstall
RUN apt-get install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
RUN apt-get install -y wget

RUN wget https://www.python.org/ftp/python/2.7.14/Python-2.7.14.tgz
RUN tar xzf Python-2.7.14.tgz


# run/create mongo db
RUN mkdir -p /data/db/
RUN chown `id -u` /data/db
RUN service mongodb start
#RUN mongod --config /etc/mongod.conf

ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-amd64/jre
ENV PATH $PATH:/usr/lib/jvm/java-1.8.0-openjdk-amd64/jre/bin:/usr/lib/jvm/java-1.8.0-openjdk-amd64/bin
RUN mvn -v

RUN cd Python-2.7.14 && ./configure && make altinstall
RUN which python2.7
RUN python2.7 -V
RUN npm config set python /usr/local/bin/python2.7/python.exe

RUN npm install -g bindings --save

RUN cd /auth-user-management/auth_user_management && npm install
RUN cd /api-gateway/api_gateway/ && npm install
RUN cd /game-engine/ && mvn clean package
RUN cd /highscores/highscores/ && npm install

#RUN ufw app list
#RUN ufw allow 'Apache Full'
#RUN ufw status

RUN npm install -g body-parser

# config mongodb?
# config webserver nodejs?

EXPOSE 80 3334

COPY initreposcripts.sh /initreposcripts.sh
# RUN scripts to start services
RUN chmod +x /initreposcripts.sh

#todo: script that calls scripts in each submodule
ENTRYPOINT ["bin/bash", "/initreposcripts.sh"]

