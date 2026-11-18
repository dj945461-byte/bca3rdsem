CREATE USER 'student1'@'localhost'
    -> IDENTIFIED BY'12345';
Query OK, 0 rows affected (0.41 sec)

mysql> GRANT SELECT,INSERT
    -> ON college.*
    -> TO'student1'@'localhost';
Query OK, 0 rows affected (0.12 sec)

mysql> SHOW GRANTS FOR 'student1'@'localhost';
+---------------------------------------------------------------+
| Grants for student1@localhost                                 |
+---------------------------------------------------------------+
| GRANT USAGE ON *.* TO `student1`@`localhost`                  |
| GRANT SELECT, INSERT ON `college`.* TO `student1`@`localhost` |
+---------------------------------------------------------------+
2 rows in set (0.01 sec)

mysql> REVOKE INSERT
    -> ON college.*
    -> FROM'sudent1'@'localhost';
ERROR 1141 (42000): There is no such grant defined for user 'sudent1' on host 'localhost'
mysql> REVOKE INSERT
    -> ON college.*
    -> FROM'student1'@'localhost';
Query OK, 0 rows affected (0.04 sec)

mysql> CTREATE TABLE account(
    -> acc_no INT PRIMARY KEY,
    -> name VARCHAR(30),
    -> balence INT
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'CTREATE TABLE account(
acc_no INT PRIMARY KEY,
name VARCHAR(30),
balence INT
)' at line 1
mysql> CREATE TABLE account(
    -> acc_no INT PRIMARY KEY,
    -> name VARCHAR(30),
    -> balence INT
    -> );
Query OK, 0 rows affected (0.28 sec)

mysql> INSERT INTO account VALUES
    -> (101,'Akash',5000),
    -> (102,'Ravi',3000),
    -> START TRANSACTION;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'START TRANSACTION' at line 4
mysql> (101,'Akash',5000),
    -> (102,'Ravi',3000),
    -> (101,'Akash',5000),
    -> (102,'Ravi',3000);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '101,'Akash',5000),
(102,'Ravi',3000),
(101,'Akash',5000),
(102,'Ravi',3000)' at line 1
mysql> (101,'Akash',5000),
    -> (102,'Ravi',3000);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '101,'Akash',5000),
(102,'Ravi',3000)' at line 1
mysql> INSERT INTO account VALUES
    -> (101,'Akash',5000),
    -> (102,'Ravi',3000);
Query OK, 2 rows affected (0.05 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

mysql> UPDATE account
    -> SET balence=6000
    -> WHERE acc_no=101;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> COMMIT;
Query OK, 0 rows affected (0.05 sec)

mysql>
mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

mysql> UPDATE account
    -> SET balence=1000
    -> WHERE acc_no=102;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> ROLLBACK;
Query OK, 0 rows affected (0.03 sec)

mysql> SELECT*FROM account;
+--------+-------+---------+
| acc_no | name  | balence |
+--------+-------+---------+
|    101 | Akash |    6000 |
|    102 | Ravi  |    3000 |
+--------+-------+---------+
2 rows in set (0.00 sec)

mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

mysql> UPDATE account SET balence=7000
    -> WHERE acc_no=101;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SAVEPOINT s1;
Query OK, 0 rows affected (0.00 sec)

mysql> UPDATE account SET balence=2000
    -> WHERE acc_no=102;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> ROLLBACK TO s1;
Query OK, 0 rows affected (0.00 sec)

mysql> COMMIT;
Query OK, 0 rows affected (0.05 sec)

mysql>