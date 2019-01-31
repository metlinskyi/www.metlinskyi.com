#!/usr/bin/env sh

git config --global user.email "gmail@metlinskyi.com"
git config --global user.name "Roman Metlinskyi"

app='/usr/share/app'

target='angular'
if [ `ls -A "$app/$target/" | wc -m` == "0" ]; then
    echo "$app/$target/ empty"
    cd "$app/"
    ng new $target
fi

target='polymer'
if [ `ls -A "$app/$target/" | wc -m` == "0" ]; then
    echo "$app/$target/ empty"
    cd "$app/"
    git clone https://github.com/PolymerLabs/start-polymer3.git $target
    cd "$target"
    npm install
fi

chmod -R 777 /usr/share/app
chmod -R 777 /usr/share/nginx/html

echo "Let's Go!"
nginx -g 'daemon off;'