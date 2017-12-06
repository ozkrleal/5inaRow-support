#!/bin/bash
#start database


#start init scripts of each service
# highscores
# authusermgmt

#NOT WORKING, NEED NEW BASH SCRIPT
#chmod +x /auth-user-management/auth_user_management/my_commands.sh
#/auth-user-management/auth_user_management/my_commands.sh 
#cd /auth-user-management/auth_user_management/
#npm install bindings --save
#npm install --save bcrypt
#node server.js

#working
# gameengine
#chmod +x /game-engine/script.sh
#cd /game-engine/
#./script.sh 

#working
# apigateway
#chmod +x /api-gateway/api_gateway/commands_scripts.sh
#/api-gateway/api_gateway/commands_scripts.sh 
cd /api-gateway/api_gateway/
node index.js &

#not working
#highscores
#cd /highscores/highscores 
#node server.js

#top
