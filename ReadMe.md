Initial Setup:

    docker build -t IMAGE_NAME .
    docker run --name CONTAINER_NAME -p 2222:22 -d IMAGE_NAME

You can also add your pub keys with this, 
```
    cat .pub | docker exec -i CONTAINER_NAME /bin/bash -c "cat >> /root/.ssh/authorized_keys"
```

Login to the container via SSH
```
    ssh -i PRIVATE root@CONTAINER_IPADDRESS
```

View current authorized PUB keys
```
    docker exec -i ssh-srv /bin/bash -c "cat /root/.ssh/authorized_keys"
```

docker stop CONTAINER_ID

docker start CONTAINER_ID

### [Thank to](https://github.com/corbinu/ssh-server) 