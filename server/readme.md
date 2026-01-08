# Server


Common settings

```bash
docker network create -d bridge metlinskyi
docker volume create www
```


## Ngnix

Build and publish

```bash
docker build --pull --rm -f "dockerfile" -t metlinskyi/com:server "."
docker push metlinskyi/com:server
docker container stop server && docker container rm server    
docker pull metlinskyi/com:server
```

### Development

```bash
docker run -d \
    --name server \
    --restart always \
    --hostname server \
    --network=metlinskyi \
    --volume=www:/var/www:ro \
    -p "80:80" \
    -p "443:443" \
    metlinskyi/com:server
```
