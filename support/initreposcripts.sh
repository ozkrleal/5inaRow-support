#!/bin/bash
#start database


#start init scripts of each service
# highscores
# authusermgmt
chmod +x /auth-user-management/my_commands.sh
/auth-user-management/my_commands.sh
# gameengine
chmod +x /game-engine/script.sh
/game-engine/script.sh
# apigateway
chmod +x /api-gateway/commands_scripts.sh
/api-gateway/commands_scripts.sh
#top -DFOREGROUND
