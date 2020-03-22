oleg@heahber:~$ cat .my.cnf
[client]
user=root
password=qwerty_25


mysql> CREATE TABLE users (id INT, name VARCHAR(255));
Query OK, 0 rows affected (0,04 sec)

mysql> 


oleg@heahber:~/Рабочий стол$ mysqldump example > example.sql
oleg@heahber:~/Рабочий стол$ ls -la
итого 20
drwxr-xr-x  3 oleg oleg      4096 мар 22 15:31 .
drwxr-xr-x 23 oleg oleg      4096 мар 22 15:31 ..
-rw-r--r--  1 oleg oleg      1820 мар 22 15:31 example.sql
-rw-r--r--  1 oleg oleg       172 мар 22 15:13 hw_sql.txt
drwxr-xr-x  6 oleg developer 4096 мар  8 17:40 test


oleg@heahber:~/Рабочий стол$ mysql sample < example.sql
oleg@heahber:~/Рабочий стол$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 28
Server version: 8.0.19 MySQL Community Server - GPL

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use sample
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables from sample;
+------------------+
| Tables_in_sample |
+------------------+
| users            |
+------------------+
1 row in set (0,00 sec)



oleg@heahber:~/Рабочий стол$ mysqldump mysql help_keyword | head -n 100 > example.sql

