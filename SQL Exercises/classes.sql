--1
SELECT num, name FROM student

--2
SELECT course.ref, enrollment.year, course.name FROM student
JOIN enrollment ON student.num=4 AND student.num=enrollment.num
JOIN course USING(ref)

--3
SELECT course.ref, enrollment.year, course.name FROM student
JOIN enrollment ON student.name='Michael' AND student.num=enrollment.num
JOIN course USING(ref)

--4
SELECT COUNT(student.num) FROM student
JOIN course ON course.name='SINF'
JOIN enrollment USING(num, ref) WHERE enrollment.year=2007

--5
SELECT AVG(enrollment.grade1) FROM student
JOIN course ON course.name='SINF'
JOIN enrollment USING(num, ref) WHERE enrollment.year=2008

--6
SELECT student.num, student.name FROM student
JOIN course ON course.name='SINF'
JOIN enrollment USING(num, ref) WHERE enrollment.year=2007 AND enrollment.grade1 IS NOT NULL AND enrollment.grade2 IS NULL
