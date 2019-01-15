# docker cmd history

- mysql
  - docker run -p 3306:3306 --name mysql-boot -e MYSQL_ROOT_PASSWORD=qwe123 -e MYSQL_DATABASE=crom -e MYSQL_USER=crom -e MYSQL_PASSWORD=qwe123 -d mysql:latest  
- postgresql
  - docker run -p 5432:5432 --name postgres-boot -e POSTGRES_USER=crom -e POSTGRES_PASSWORD=qwe123 -e POSTGRES_DB=crom -d postgres  
