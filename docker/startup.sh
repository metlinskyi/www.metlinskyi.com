#!/usr/bin/env sh


git config --global user.email "gmail@metlinskyi.com"
git config --global user.name "Roman Metlinskyi"

app='/usr/share/app'
if find "$app" -mindepth 1 -print -quit 2>/dev/null | grep -q .; then
    echo "$app is exists"
else
    mkdir $app
fi

target='angular'
if find "$app/$target" -mindepth 1 -print -quit 2>/dev/null | grep -q .; then
    echo "$app/$target is exists"
else
    cd "$app/"
    ng new $target
fi

target='polymer'
if find "$app/$target" -mindepth 1 -print -quit 2>/dev/null | grep -q .; then
    echo "$app/$target is exists"
else
    cd "$app/"
    git clone https://github.com/PolymerLabs/start-polymer3.git $target
    cd "$target"
    npm install
fi


chmod -R 777 /usr/share/app
chmod -R 777 /usr/share/nginx/html

echo "Let's Go!"
nginx -g 'daemon off;'