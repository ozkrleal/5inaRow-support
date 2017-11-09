FROM ubuntu
 
MAINTAINER Oscar Leal "ozkralm10@hotmail.com"

#####
# install dependencies
# 
#RUN apt-get install software-properties-common

# Add PPA to install Java
#RUN add-apt-repository ppa:webupd8team/java
#RUN apt-get update
#RUN apt-get install git curl oracle-java7-installer
### install java, mongodb, nodejs, 
### bash scripts? 
### what ports should be used for each service
####

# Update aptitude with new repo
RUN apt-get update

# Install software 
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

