# ![alt text](https://github.com/metlinskyi/www.metlinskyi.com/blob/master/.github/assets/header.png?raw=true)


## Submodules
- **`api`** - .NET Core 9.0 Web API with async polling pattern
- **`server`** - Proxy-server by Nginx
- **`www`** - Browser-based terminal emulator (vanilla JavaScript)

```bash
git submodule add git@github.com:metlinskyi/<name>.git <dir>
```

## Workflows

```bash
docker build --pull --rm -f "dockerfile.api" -t metlinskyi/com:api "."
docker push metlinskyi/com:api
```

```bash
docker build --pull --rm -f "dockerfile.server" -t metlinskyi/com:server "."
docker push metlinskyi/com:serve
```

```bash
docker build --pull --rm -f "dockerfile.www" -t metlinskyi/com:www "."
docker push metlinskyi/com:www
```


&nbsp;
============
&copy; [The Best Software Engineer in The Universe!](https://www.linkedin.com/in/metlinskyi/)
