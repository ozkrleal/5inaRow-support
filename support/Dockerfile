FROM ubuntu
 
MAINTAINER Oscar Leal "ozkralm10@hotmail.com"


#####################################
# install dependencies
# 
#RUN apt-get install software-properties-common
#####################################
# Add PPA to install Java
#RUN add-apt-repository ppa:webupd8team/java
#RUN apt-get update
#RUN apt-get install git curl oracle-java7-installer
### install java, mongodb, nodejs, 
### bash scripts? 
### what ports should be used for each service
#### ports communicate withc each other, only one is visible to real world
#### specify ports for ea
#####################################


# Update aptitude with new repo
RUN apt-get update

#install java
RUN install -y default-jre
#copies application from its folder to our image, assumes docker build is run from myapp/src
ADD /build/distributions/myapp.jar /myapp.jar
CMD ["java", "-jar myapp.jar"]


#install mongodb
RUN docker pull mongo:latest
RUN docker run -v "#(pwd)":/data --name mongo -d mongo mongod --smallfiles
RUN docker run -it --link mongo:mongo --rm mongo sh -c 'exec mongo "$MONGO_PORT_27017_TCP_ADDR:$MONGO_PORT_27017_TCP_PORT/test"'
RUN docker exec -it mongo bash

#test if mongodb is working
RUN mongo
RUN db.col.insert({"a" : 4})
RUN db.col.find().pretty()

#################################
#v2 install mongo
#RUN apt-get install -y mongodb-org
#RUN mkdir -p /data/db
#RUN chown -R mongodb:mongodb /data/db
#v2 Load config of database?? 
#ADD mongodb.conf /etc/mongodb.conf
#ADD mongodb.pem /etc/ssl/certs/mongodb.pem
##################################


#install NodeJS
RUN docker pull node:latest
#RUN docker run -it --rm node
RUN docker run -it --name node -v "$(pwd)":/data --link mongo:mongo -w /data -p 8082:8082 node bash


#################################
# Install Curl and Nodejs
#RUN apt-get install curl
#RUN curl -sL https://deb.nodesource.com/setup_4.x | bash
#RUN apt-get install nodejs
#check if installed
#RUN node -v
#################################


# Install git
RUN apt-get install -y git
# Make ssh dir
RUN mkdir ~/.ssh/

# Copy over private key, and set permissions
ADD id_rsa ~/.ssh/id_rsa

# Create known_hosts
RUN touch ~/.ssh/known_hosts
# Add github key
RUN ssh-keyscan github.com >> ~/.ssh/known_hosts

# Clone the git repos of environments into the docker container
RUN git clone git@github.com:ozkrleal/5inaRow-game-engine.git
RUN git clone git@github.com:ozkrleal/5inaRow-API-gateway.git
RUN git clone git@github.com:ozkrleal/5inaRow-auth-user-management.git
RUN git clone git@github.com:ozkrleal/5inaRow-highscores.git
RUN git clone git@github.com:ozkrleal/5inaRow-front-end.git

# Create docker container?
RUN docker build -t 5inarow .

# run docker container
RUN docker run -d -p 4000:80 5inarow

# RUN scripts to start services

