--1
SELECT name, city FROM airport WHERE country='Portugal'


--2
SELECT name FROM plane, model WHERE plane.modelcod=model.modelcod AND model.version='DC-10'
SELECT name FROM plane JOIN model ON plane.modelcod=model.modelcod AND model.version='DC-10'
SELECT name FROM plane JOIN model USING(modelcod) WHERE model.version = 'DC-10'


--3
SELECT plane.name AS plane_name, model.engines FROM plane, model WHERE plane.modelcod = model.modelcod
SELECT plane.name AS plane_name, model.engines FROM plane JOIN model ON plane.modelcod = model.modelcod
SELECT plane.name AS plane_name, model.engines FROM plane JOIN model USING(modelcod)

--4
SELECT COUNT(*) AS number FROM flight WHERE duration='2' OR duration='3'

--5
SELECT DISTINCT plane.modelcod, model.version FROM plane JOIN model USING(modelcod) WHERE model.version LIKE 'A3%'

--6
SELECT flightcod, duration FROM flight ORDER BY duration DESC, flightcod

--7
SELECT firstleg.flightcod AS flightcod1, secondleg.flightcod AS flightcod2, firstleg.toairportcod AS intermediate_airport_code
FROM flight AS firstleg JOIN flight AS secondleg
ON firstleg.toairportcod = secondleg.fromairportcod
WHERE firstleg.fromairportcod=1 AND secondleg.toairportcod=12

--8
SELECT COUNT(*)
FROM airport
GROUP BY (country)
ORDER BY COUNT(*)

--9
SELECT flightcod, origin.name AS origin, destination.name AS destination
FROM flight JOIN airport AS origin
ON flight.fromairportcod = origin.airportcod
JOIN airport AS destination
ON flight.toairportcod = destination.airportcod
ORDER BY flightcod

--10
SELECT flightcod
FROM flight JOIN airport AS origin
ON flight.fromairportcod = origin.airportcod
JOIN airport AS destination
ON flight.toairportcod = destination.airportcod
WHERE destination.city = 'Lisboa' AND origin.city = 'Porto'

--11
SELECT country, COUNT(*) AS number
FROM airport
GROUP BY (country)
HAVING COUNT(*) > 2
ORDER BY COUNT(*)

--12
SELECT country, COUNT(*) AS number
  FROM airport
  GROUP BY (country)
  HAVING COUNT(*) >= ALL( SELECT COUNT(*)
   FROM airport
   GROUP BY (country))

--13
SELECT make, version, COUNT(*) AS number
  FROM plane JOIN model
  USING(modelcod)
  GROUP BY modelcod, make, version
  ORDER BY COUNT(*) DESC

--14
SELECT make, version, COUNT(name) AS number
  FROM plane RIGHT JOIN model
  USING(modelcod)
  GROUP BY modelcod, make, version
  ORDER BY COUNT(name) DESC
