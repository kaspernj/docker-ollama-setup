docker compose stop
docker compose rm -f
docker rm `docker ps -a | egrep "ghcr.io/open-webui/open-webui:main" | awk '{print$1}' | xargs`
docker rmi `docker image ls | egrep "ollama/ollama" | awk '{print$3}' | xargs`
docker rmi `docker image ls | egrep "ghcr.io/open-webui/open-webui" | awk '{print$3}' | xargs`
docker rmi `docker image ls | egrep "universonic/stable-diffusion-webui" | awk '{print$3}' | xargs`
docker compose pull
docker compose up -d
