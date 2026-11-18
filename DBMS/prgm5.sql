SELECT*FROM student
    -> WHERE marks>(SELECT AVG(marks)FROM student);
Empty set (0.05 sec)

mysql> SELECT*FROM student
    -> WHERE marks=(SELECT MAX(marks)FROM student);
Empty set (0.02 sec)

mysql> SELECT*FROM student
    -> WHERE department=(
    -> SELECT department
    -> FROM student
    -> WHERE student
    -> WHERE name='Akash'
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'WHERE name='Akash'
)' at line 6
mysql> SELECT*FROM student
    -> WHERE department=(
    -> SELECT department
    -> FROM student
    -> WHERE name='Akash'
    -> );
Empty set (0.00 sec)

mysql> SELECT*FROM student
    -> WHERE marks
    -> FROM student
    -> WHERE name='Ravi'
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'FROM student
WHERE name='Ravi'
)' at line 3
mysql> SELECT*FROM student
    -> WHERE marks>(
    -> FROM student
    -> WHERE name='Ravi'
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'FROM student
WHERE name='Ravi'
)' at line 3
mysql> SELECT*FROM student
    -> WHERE marks>(
    -> SELECT marks
    -> FROM student
    -> WHERE name='Ravi'
    -> );
Empty set (0.00 sec)

mysql> SELECT MAX(marks)
    -> FROM student
    -> WHERE marks <(
    -> SELECT MAX(marks)
    -> FROM student
    -> );
+------------+
| MAX(marks) |
+------------+
|       NULL |
+------------+
1 row in set (0.02 sec)

mysql>