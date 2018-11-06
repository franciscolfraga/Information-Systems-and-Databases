--1
SELECT physician.name AS name FROM physician

--2
SELECT patient.name, patient.address FROM patient

--3
SELECT appointment.date FROM appointment JOIN patient USING(code)
WHERE patient.code = '12345'

--4
SELECT designation FROM condition ORDER BY designation

--5
SELECT patient.code AS number, patient.name FROM patient
      JOIN appointment USING(code)
      WHERE appointment.date = '2007-01-01'
