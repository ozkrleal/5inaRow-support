FROM ubuntu
 
MAINTAINER Oscar Leal "ozkralm10@hotmail.com"

#####
# install dependencies
#RUN apt-get install software-properties-common

# Add PPA to install Java
#RUN add-apt-repository ppa:webupd8team/java
#RUN apt-get update
#RUN apt-get install git curl oracle-java7-installer

####

# Update aptitude with new repo
RUN apt-get update

# Install software 
RUN apt-get install -y git
# Make ssh dir
RUN mkdir /root/.ssh/

# Copy over private key, and set permissions
ADD id_rsa /root/.ssh/id_rsa

# Create known_hosts
RUN touch /home/oscar/.ssh/known_hosts
# Add github key
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

# Clone the conf files into the docker container
RUN git clone git@github.com:ozkrleal/5inaRow-game-engine.git
RUN git clone git@github.com:ozkrleal/5inaRow-API-gateway.git
RUN git clone git@github.com:ozkrleal/5inaRow-auth-user-management.git
RUN git clone git@github.com:ozkrleal/5inaRow-highscores.git
RUN git clone git@github.com:ozkrleal/5inaRow-front-end.git

# Create docker container?
RUN docker build -t 5inarow .
