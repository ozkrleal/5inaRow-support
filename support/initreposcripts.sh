#!/bin/bash
#start database
sudo service mongod start

#start init scripts of each service
# highscores
# authusermgmt
chmod +x /auth-user-management/my_commands.sh
./auth-user-management/my_commands.sh
# gameengine
# apigateway
chmod +x /api-gateway/commands_scripts.sh
./api-gateway/commands_scripts.sh

