#!/bin/bash
git submodule add git@github.com:ozkrleal/5inaRow-game-engine.git game-engine
git submodule add git@github.com:ozkrleal/5inaRow-API-gateway.git api-gateway
git submodule add git@github.com:ozkrleal/5inaRow-auth-user-management.git auth-user-management
git submodule add git@github.com:ozkrleal/5inaRow-highscores.git highscores
git submodule add git@github.com:ozkrleal/5inaRow-front-end.git front-end

git submodule update --init
#pulls last commit
git submodule update --remote --merge

sudo docker build -t 5inarow .

sudo docker run -d -p 5000:5000 5inarow /bin/bash -i -t


