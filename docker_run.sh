
docker stop $(docker ps -aqf "ancestor=model_api") # If there is currently running docker, stop it first
docker build --tag model_api . # Build docker image with Dockerfile
docker run -d --restart always -p 8000:8000 model_api