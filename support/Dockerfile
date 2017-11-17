FROM ubuntu
 
MAINTAINER Oscar Leal "ozkralm10@hotmail.com"


# dependencies
# mongodb dependency
RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
RUN echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
RUN sudo apt-get update

RUN sudo apt-get install -y mongodb-org

RUN sudo apt-get install -y nodejs
RUN sudo apt-get install -y npm

RUN sudo apt-get install default-jre

# copy gits one by one to image
COPY api-gateway /binaries/api-gateway/
COPY auth-user-management /binaries/auth-user-management/
COPY front-end /binaries/front-end/
COPY game-engine /binaries/game-engine/
COPY highscores /binaries/highscores/

# run/create mongo db
RUN sudo service mongod start

# config mongodb?
# config webserver nodejs?

# RUN scripts to start services

#todo: script that calls scripts in each submodule
#ENTRYPOINT ["bin/bash", "/initreposcripts.sh"]

