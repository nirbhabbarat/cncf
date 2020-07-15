docker rm -f docker_node_js_express
docker rmi -f docker_node_js_express:v1
docker build -t docker_node_js_express:v1 .

docker run -p 3000:3000 \
  --network docker_network \
  --name docker_node_js_express \
  docker_node_js_express:v1 


