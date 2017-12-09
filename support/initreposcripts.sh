#!/bin/bash
#start database
service apache2 start
service mongodb start
service mongodb status

#start init scripts of each service



cd /auth-user-management/auth_user_management/
npm install bcrypt --save
node server.js &
echo "auth-usr initialized"

cd /api-gateway/api_gateway/
node index.js &
echo "Api gateway initialized"

cd /highscores/highscores 
node server.js  &
echo "Highscores initialized" 

chmod +x /game-engine/script.sh
cd /game-engine/
mvn spring-boot:run 
echo "java initialized" 


