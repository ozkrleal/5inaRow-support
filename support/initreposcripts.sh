#!/bin/bash
#start database
mongod &

#start init scripts of each service
# highscores
# authusermgmt

#NOT WORKING, NEED NEW BASH SCRIPT
#chmod +x /auth-user-management/auth_user_management/my_commands.sh
#/auth-user-management/auth_user_management/my_commands.sh 
#cd /auth-user-management/auth_user_management/
#npm install bcrypt --save
#node server.js


#npm install bindings --save


#working
# gameengine
#chmod +x /game-engine/script.sh
#cd /game-engine/
#./script.sh 

#working
# apigateway
#cd /api-gateway/api_gateway/
#node index.js &

#almost working
#highscores
cd /highscores/highscores 
node server.js

#top
