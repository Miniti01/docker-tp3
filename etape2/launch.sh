docker build -t myphpdb .
docker run -d --name DATA --network tp3-network -e MARIADB_RANDOM_ROOT_PASSWORD=yes -e MARIADB_DATABASE=testdb -e MARIADB_USER=devuser -e MARIADB_PASSWORD=devpass -v $(pwd)/sql/create.sql:/docker-entrypoint-initdb.d/create.sql mariadb
docker run -d --name SCRIPT --network tp3-network -v $(pwd)/src:/app myphpdb
docker run -d --name HTTP --network tp3-network -p 8080:80 -v $(pwd)/src:/app -v $(pwd)/config/default.conf:/etc/nginx/conf.d/default.conf nginx
