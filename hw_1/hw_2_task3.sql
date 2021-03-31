
/* сделала задание через Workbench, тк через терминал не получилось
10:53:00 Dumping example (all tables)
Running: mysqldump.exe --defaults-file="C:\Users\81E4~1\AppData\Local\Temp\tmp0q8o4s8m.cnf"  --host=localhost --port=3306 --default-character-set=utf8 --user=root --protocol=tcp --skip-triggers "example"
10:53:02 Export of b'D:\\_Backup\\geek_brain\\\xd0\x91\xd0\xb0\xd0\xb7\xd1\x8b \xd0\xb4\xd0\xb0\xd0\xbd\xd0\xbd\xd1\x8b\xd1\x85\\example.sql' has finished
mysql -u root -p sample < sample.sql 
10:57:02 Restoring D:\_Backup\geek_brain\Базы данных\example.sql
Running: mysql.exe --defaults-file="C:\Users\81E4~1\AppData\Local\Temp\tmpw4ta_s10.cnf"  --protocol=tcp --host=localhost --user=root --port=3306 --default-character-set=utf8 --comments --database=sample  < "D:\\_Backup\\geek_brain\\Базы данных\\example.sql"
10:57:03 Import of D:\_Backup\geek_brain\Базы данных\example.sql has finished 
*/
SHOW DATABASES;
DESCRIBE sample.users;