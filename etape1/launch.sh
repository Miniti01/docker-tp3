docker run -d --name SCRIPT --network tp3-network -v $(pwd)/src:/app php:7.4-fpm
docker run -d --name HTTP --network tp3-network -p 8080:80 -v $(pwd)/src:/app -v $(pwd)/config/default.conf:/etc/nginx/conf.d/default.conf nginx
