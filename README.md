# ![alt text](https://github.com/metlinskyi/www.metlinskyi.com/blob/_/.github/assets/header.png?raw=true)


## Submodules
- **`api`** - .NET Core 9.0 Web API with async polling pattern
- **`server`** - Proxy-server by Nginx
- **`www`** - Browser-based terminal emulator (vanilla JavaScript)

```bash
git submodule add git@github.com:metlinskyi/<name>.git <dir>
```

## Workflows

Docker initialization
```bash
docker network create -d bridge metlinskyi
docker volume create letsencrypt
docker volume create www
```

### API (REST/gRPC)

#### Development environment
```bash
docker build --pull --rm -f "dockerfile.api" -t metlinskyi/com:api-development "." \
        --build-arg environment=Development \
        --no-cache --progress=plain 
docker run -d \
    --name api \
    --network=metlinskyi \
    -h api \
    -p 8081:8081 \
    -p 8082:8082 \
    metlinskyi/com:api-development
```

#### Production environment
```bash
docker build --pull --rm -f "dockerfile.api" -t metlinskyi/com:api "."
docker push metlinskyi/com:api
```
```bash
docker pull metlinskyi/com:api
docker run -d --restart always \
    --name api \
    --network=metlinskyi \
    -h api \
    metlinskyi/com:api
```

#### Common commands
```bash
docker container stop api && docker container rm api    
docker logs api
```


### Server

#### Development environment
```bash
docker build --pull --rm -f "dockerfile.server" -t metlinskyi/com:server-development "." \
        --build-arg environment=development \
        --build-arg certificate=selfsigned 
docker run -d \
        --name server \
        --network=metlinskyi \
        -h server \
        -p 80:80 \
        -p 443:443 \
        -p 8080:8080 \
        -v www:/var/www:ro \
        -v $(pwd)/server/ssl/selfsigned:/etc/nginx/ssl \
        metlinskyi/com:server-development
```

#### Production environment
```bash
docker build --pull --rm -f "dockerfile.server" -t metlinskyi/com:server "." 
docker push metlinskyi/com:server
```
```bash
docker pull metlinskyi/com:server
docker run -d --restart always \
        --name server \
        --network=metlinskyi \
        -h server \
        -p 80:80 \
        -p 443:443 \
        -p 8080:8080 \
        -v www:/var/www:ro \
        -v letsencrypt:/etc/letsencrypt/live/metlinskyi.com:rw \
        metlinskyi/com:server
```

#### Common commands
```bash
docker container stop server && docker container rm server    
docker logs server
```


### UI

```bash
docker build --pull --rm -f "dockerfile.www" -t metlinskyi/com:www "."
docker push metlinskyi/com:www
```
```bash
docker pull metlinskyi/com:www
docker run -d  \
        --name www \
        --network=metlinskyi \
        -h www \
        -v www:/var/www:rw \
        metlinskyi/com:www
```


&nbsp;
============
&copy; [The Best Software Engineer in The Universe!](https://www.linkedin.com/in/metlinskyi/)