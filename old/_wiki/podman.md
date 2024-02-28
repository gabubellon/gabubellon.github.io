---
title: podman
tags: [wiki,podman.macos]
layout: post
---

---

<<< TODO DOCKER >>>Ins


## Install `podman`

```bash
 brew install podman
 ```
 
 ## Crie uma virtual machine
 
 ```bash
 podman machine init
```
 
 ## Configure pra acesso root aos pods
 ```bash
 podman machine set --rootful
 ```
 
 ## Inice a virtual machine
 ```bash
 podman machine start
 ```
 
 ## Executa o comando exibido para não precisar configura o `DOCKER_HOST`
 
```bash
#esse caminho pode mudar de acordo com a sua instalaçãp
sudo /usr/local/Cellar/podman/4.4.1/bin/podman-mac-helper install
podman machine stop; podman machine start
```

## Substituindo o docker 

```bash
# Cria um alias do docker para o podman (os caminhos podem mudar)
ln -s /usr/local/bin/podman /usr/local/bin/docker
brew install docker-compose
```

