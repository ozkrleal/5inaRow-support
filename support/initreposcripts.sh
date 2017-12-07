#!/bin/bash
#start database
service apache2 start
mongod &

#start init scripts of each service
# highscores
# authusermgmt

#NOT WORKING, NEED NEW BASH SCRIPT
#chmod +x /auth-user-management/auth_user_management/my_commands.sh
#/auth-user-management/auth_user_management/my_commands.sh 
cd /auth-user-management/auth_user_management/
npm install bcrypt --save
node server.js &

echo "auth-usr finished"
#npm install bindings --save

echo "Api starting"
#working
# apigateway
cd /api-gateway/api_gateway/
node index.js &
echo "Api finished"

echo "highscores starting"

#almost working
#highscores
cd /highscores/highscores 
node server.js  &

echo "java starting"
#working
# gameengine
chmod +x /game-engine/script.sh
cd /game-engine/
mvn spring-boot:run 
echo "java finished" 


