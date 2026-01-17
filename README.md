# ![alt text](https://github.com/metlinskyi/www.metlinskyi.com/blob/_/.github/assets/header.png?raw=true)


## Submodules
- **`api`** - .NET Core 9.0 Web API with async polling pattern
- **`server`** - Proxy-server by Nginx
- **`www`** - Browser-based terminal emulator (vanilla JavaScript)

```bash
git submodule add git@github.com:metlinskyi/<name>.git <dir>
```

## Workflows


### API (gRPC)

```bash
docker build --pull --rm -f "dockerfile.api" -t metlinskyi/com:api "."
docker push metlinskyi/com:api
```

### Server

Build Docker image
```bash
docker build --pull --rm -f "dockerfile.server" -t metlinskyi/com:server "."
docker push metlinskyi/com:server
```

Run on production server
```bash
docker container stop server && docker container rm server    
docker pull metlinskyi/com:server
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

Other commands
```bash
docker logs server
```

### UI

```bash
docker build --pull --rm -f "dockerfile.www" -t metlinskyi/com:www "."
docker push metlinskyi/com:www
```

dotnet nuget add api/Api/Api.csproj source packages

sudo usermod -aG docker github
&nbsp;
============
&copy; [The Best Software Engineer in The Universe!](https://www.linkedin.com/in/metlinskyi/)
