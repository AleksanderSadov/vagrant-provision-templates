CREATE USER 'example'@'localhost' IDENTIFIED BY 'example';
GRANT ALL PRIVILEGES ON classicmodels.* TO 'example'@'localhost';
FLUSH PRIVILEGES;
