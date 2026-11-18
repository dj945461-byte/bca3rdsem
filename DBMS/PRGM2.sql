mysql> CREATE DATABASE college;
ERROR 1007 (HY000): Can't create database 'college'; database exists
mysql> USE college;
Database changed
mysql> CREATE TABLE employee(
    -> emp_id INT,
    -> emp_name VARCHAR(50),
    -> salary INT
    -> );
Query OK, 0 rows affected (0.43 sec)

mysql> ALTER TABLE employee
    -> ADD department VARCHAR(30);
Query OK, 0 rows affected (0.89 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table EMPLOYEE
    -> MODIFY salary DECIMAL(10,2);
Query OK, 0 rows affected (1.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> RENAME TABLE employee TO staff;
Query OK, 0 rows affected (0.18 sec)

mysql> TRUNCATE TABLE staff;
Query OK, 0 rows affected (0.31 sec)

mysql> DROP TABLE staff;
Query OK, 0 rows affected (0.24 sec)

mysql>