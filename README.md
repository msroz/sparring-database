# 🥊 sparring-database

Playground for MySQL (with Ruby).

## Containers

|name|note|
|----|----|
|sparring-mysql|mysql container|
|sparring-workspace|workspace with Ruby.|


## Get it started

```console
$ git clone git@github.com:msroz/parring-database.git
$ cd sparring-database

# Build images and start running containers. 
$ make setup # same as `make build && make up`

# Attach ruby container
$ make attach-workspace

# Attach mysql container
$ make attach-db

# Connect mysql as `root` user.
$ make login-db

# Stop and Remove containers
$ make clean # same as `make stop && make rm`
```

### sparring-mysql

```
mysql> select version();
+-----------+
| version() |
+-----------+
| 5.7.26    |
+-----------+
1 row in set (0.00 sec)
```

### sparring-workspace

```
$ ruby -v
ruby 2.6.3p62 (2019-04-16 revision 67580) [x86_64-linux]
```
