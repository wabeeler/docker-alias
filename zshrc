# ------------------------------------
# Docker alias and function
# ------------------------------------

# Get latest container ID
alias dl="docker ps -l -q"

# Get container process
alias dps="docker ps"

# Get process included stop container
alias dpa="docker ps -a"

# Get images
alias di="docker images"

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias drd="docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
alias dri="docker run -i -t -P"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"

# Kill running container
alias dki="docker kill"

# Stop all containers
dStopAll() { docker stop $(docker ps -a -q); }
alias dstop="dStopAll"

# Remove all containers
dRemoveAllContainers() { docker rm $(docker ps -a -q); }
alias drm="dRemoveAllContainers"

# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Remove all images
dockerRemoveImages() { docker rmi $(docker images -q); }
alias drmi="dockerRemoveImages"

# Dockerfile build, e.g., $dbu tcnksm/test 
dBuild() { docker build -t=$1 .; }
alias dbu="dBuild"

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# Bash into running container
dBash() { docker exec -it $(docker ps -aqf "name=$1") bash; }
alias dbash="dBash"

# Docker-Compose Aliases
alias dc="docker-compose"
alias dcbu="docker-compose build"
alias dcup="docker-compose up -d"
alias dcdn="docker-compose down"
alias dclg="docker-compose logs"
alias dclf="docker-compose logs -f"
