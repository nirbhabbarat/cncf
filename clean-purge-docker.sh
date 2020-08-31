docker stop $(docker ps -a -q)
docker images -a | grep "pattern" | awk '{print $3}' | xargs docker rmi
docker rmi $(docker images -a -q)
docker rm $(docker ps -a -q)
docker volume prune
