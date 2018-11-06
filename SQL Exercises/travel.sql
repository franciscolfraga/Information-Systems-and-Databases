--1
SELECT stop.name FROM stop WHERE stop.day='2007-05-24'

--2
SELECT DISTINCT city.country FROM city
JOIN stop ON stop.day='2008-03-02' AND stop.name=city.name
