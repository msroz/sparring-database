CREATE DATABASE IF NOT EXISTS sparring;

CREATE USER 'sparring'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'sparring'@'%';
