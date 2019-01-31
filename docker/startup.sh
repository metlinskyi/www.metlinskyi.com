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

alias angular-serve="cd $app/$target && ng serve --open"
echo "cd $app/$target && ng serve --open"

cd "$app/$target" && ng serve --open >/dev/null &

target='polymer'
if [ `ls -A "$app/$target/" | wc -m` == "0" ]; then
    echo "$app/$target/ empty"
    cd "$app/"
    git clone https://github.com/PolymerLabs/start-polymer3.git $target
    cd "$target"
    npm install
fi

alias polymer-serve="cd $app/$target && polymer serve --port 3000"
echo "cd $app/$target && polymer serve --port 3000"

cd "$app/$target" && polymer serve --port 3000 >/dev/null &

chmod -R 777 /usr/share/app
chmod -R 777 /usr/share/nginx/html

echo "Let's Go!"
nginx -g 'daemon off;'