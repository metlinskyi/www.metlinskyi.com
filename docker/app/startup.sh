#!/usr/bin/env sh

app='/usr/share/app'


target='angular'
if [ `ls -A "$app/$target/" | wc -m` == "0" ]; then
    cd "$app/"
    ng new $target
fi
cd "$app/$target" && ng serve --port 8081 >/dev/null &


target='reactjs'
if [ `ls -A "$app/$target/" | wc -m` == "0" ]; then
    cd "$app/"
    npm init react-app $target
fi

export PORT=8082 && cd "$app/$target" && npm start >/dev/null &


target='vuejs'
if [ `ls -A "$app/$target/" | wc -m` == "0" ]; then
    cd "$app/"
    vue create $target --default
fi
cd "$app/$target/src" && vue serve >/dev/null &


target='emberjs'
if [ `ls -A "$app/$target/" | wc -m` == "0" ]; then
    cd "$app/"
    ember new $target 
fi
cd "$app/$target" && ember server --port 8085 >/dev/null &


target='polymer'
if [ `ls -A "$app/$target/" | wc -m` == "0" ]; then
    cd "$app/"
    git clone https://github.com/PolymerLabs/start-polymer3.git $target
    cd "$target"
    npm install
fi
cd "$app/$target" && polymer serve --port 8088 >/dev/null &


chmod -R 777 /usr/share/app
chmod -R 777 /usr/share/nginx/html

echo "Let's Go!"
nginx -g 'daemon off;'