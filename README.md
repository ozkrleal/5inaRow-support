# 5inaRow

It is a Microservices project for the class Project Laboratory of BME.


## Content

### Installation

1. Install Docker

Windows (not tested)
https://docs.docker.com/docker-for-windows/install/

Mac (preferred)
https://docs.docker.com/docker-for-mac/install/

Ubuntu (preferred)
Run ./installdocker.sh on 5inaRow-support/support/install-docker/


Previous to step 2:
Install Git in your machine. (Ubuntu/Mac)
````
sudo apt-get install git
````
For Windows read documentation in:
https://git-scm.com/download/win

Be sure to set your user name and email from GitHub at:
````
git config --global user.email "your@email.com"

git config --global user.name "username"
````

2. 
2a Clone repository via SSH (recommended)
Authentication in:
https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
````
git clone git@github.com:ozkrleal/5inaRow-support.git
````

2b Clone repository via HTTPS
Authentication in:
https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/
````
git clone https://github.com/ozkrleal/5inaRow-support.git
````
3.
Be sure to set your user name and email from GitHub at:
````
git config --global user.email "your@email.com"

git config --global user.name "username"
````

4. 

Go inside the 5inaRow-support/support/ on Terminal.

Run these instructions to install the container and run it in your machine.



4a For Ubuntu and Mac

````
./createDockerfile.sh

./enable.sh
````

4b For Windows (not tested)
Run enable.sh in CMD and set Permissions.

INFO:
createDockerfile is going to locate a Dockerfile based on your current OS (Linux and Mac supported only), and then enable will clone all the other needed repos, build the image AND run it. (If you prefer HTTPS rather than SSH, run ./enableHTTP.sh instead).


5. 
Inside 5inaRow-support/support/ on Terminal.

For killing running containers
````
./killContainers.sh
````

For running a container built on a previously created image (use this only if you have used enable before, then killed the container and you want to run another instance):
````
./runDocker.sh
````

For deleting all built images and containers to free space. (create everything again running enable)
````
./cleanimagescontainers.sh
````

OPTIONAL, not needed: For only pulling the repos without building the docker container (./githubpullHTTP.sh for HTTPS instead of SSH)
````
./githubpull.sh
````
