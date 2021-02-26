Initial Setup:

    docker build -t IMAGE_NAME .
    docker run -d --name CONTAINER_NAME -p 6229:6229 -v /var/run/docker.sock:/var/run/docker.sock --restart unless-stopped IMAGE_NAME

You (can | must for first run) also add your pub keys with this, 
```
    cat .pub | docker exec -i CONTAINER_NAME /bin/bash -c "cat >> /root/.ssh/authorized_keys"
```

Login to the container via SSH
```
    ssh -i PRIVATE -p 6229 root@HOST
```

View current authorized PUB keys
```
    docker exec -i ssh-srv /bin/bash -c "cat /root/.ssh/authorized_keys"
```

docker stop CONTAINER_ID

docker start CONTAINER_ID

you can also start a container with `--rm` so that it will be automatically removed when the container stops.

### [Thank to](https://github.com/corbinu/ssh-server) 