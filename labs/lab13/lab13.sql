.read data.sql


CREATE TABLE bluedog AS
  SELECT color AS color, pet as pet FROM students WHERE color = 'blue' and pet = 'dog';

CREATE TABLE bluedog_songs AS
  SELECT color as color , pet as pet, song as song FROM students WHERE color = 'blue' and pet = 'dog';


CREATE TABLE matchmaker AS
  SELECT a.pet, a.song, a.color, b.color FROM students as a, students as b
  WHERE a.pet = b.pet AND a.song = b.song AND a.time < b.time;


CREATE TABLE sevens AS
  SELECT a.seven FROM students as a, numbers as b
   WHERE a.number = 7 AND b.'7' = 'True' AND a.time = b.time;


CREATE TABLE favpets AS
  SELECT pet AS pet, count(*) AS count FROM students GROUP BY pet ORDER by count DESC LIMIT 10 ;


CREATE TABLE dog AS
  SELECT a.pet, a.count FROM favpets as a
  WHERE a.pet = 'dog';


CREATE TABLE bluedog_agg AS
  SELECT song, count(*) as count FROM bluedog_songs GROUP BY song ORDER BY count DESC ;


CREATE TABLE instructor_obedience AS
  SELECT seven, instructor, count(*) AS count FROM students WHERE seven = "7" GROUP BY instructor ORDER BY count;
