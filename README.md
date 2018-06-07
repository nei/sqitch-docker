# Build image
```
export SQITCH_PROJECT_NAME='yourproject' # CHANGE_THIS
export SQITCH_REPO='/path/to/your/sqitch/repo' # CHANGE_THIS
docker build -t rodoxx:sqitch .

docker volume create sqitch-mysql-data
docker run -p 3366:3306 \
	-e MYSQL_ALLOW_EMPTY_PASSWORD=yes \
	-e MYSQL_DATABASE=$PROJECT_NAME \
	-v $SQITCH_REPO:/var/sqitch \
  -v sqitch-mysql-data:/var/lib/mysql \
	-d rodoxx:sqitch
```

# How to get start with Sqitch

## Set your local config

```
$ sqitch init test --uri https://github.com/rodoxx/sqitch.git --engine mysql
$ sqitch config --user user.name 'Rodolfo'
$ sqitch config --user user.email 'rodolfomilanez@gmail.com'
$ sqitch config --user engine.mysql.client /usr/bin/mysql
$ sqitch target add localhost db:mysql://root@localhost/databasename
```

## Create a migration file
```
sqitch add orders -n 'Create orders table'
```

