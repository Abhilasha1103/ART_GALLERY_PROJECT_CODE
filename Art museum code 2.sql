CREATE DATABASE art_gallery;
USE art_gallery;


-- List all artworks along with their artists and styles

SELECT m.work_id, a.full_name AS artist_name, m.style
FROM museum_names m
JOIN artist_info a ON m.artist_id = a.artist_id;


-- Find all museums in the USA

SELECT name, city, state 
FROM location 
WHERE country = 'USA';


-- Retrieve all artists born before 1800

SELECT full_name, birth 
FROM artist_info 
WHERE birth < 1800;

-- Get all artworks belonging to the 'Baroque' style

SELECT names 
FROM museum_names 
WHERE style = 'Baroque';

--  Count how many artworks each artist has created

SELECT a.full_name, COUNT(m.work_id) AS total_artworks
FROM museum_names m
JOIN artist_info a ON m.artist_id = a.artist_id
GROUP BY a.full_name
ORDER BY total_artworks DESC;


--  Find the total number of museums in each country

SELECT country, COUNT(museum_id) AS museum_count 
FROM location 
GROUP BY country 
ORDER BY museum_count DESC;

--  Find the most popular art style (i.e., the one with the most artworks)

SELECT style, COUNT(*) AS artwork_count 
FROM museum_names 
GROUP BY style 
ORDER BY artwork_count DESC 
LIMIT 1;

-- Count how many artworks are in each subject category

SELECT COUNT(m.work_id) AS total_artworks
FROM subject s
JOIN museum_names m ON s.work_id = m.work_id
ORDER BY total_artworks DESC;

-- Find all artworks stored in "The Museum of Modern Art"

SELECT l.name AS museum_name
FROM museum_names m
JOIN location l ON m.museum_id = l.museum_id
WHERE l.name = 'The Museum of Modern Art';

--  Find all artworks painted by a specific artist (e.g., "Pablo Picasso")

SELECT *
FROM museum_names m
JOIN artist_info a ON m.artist_id = a.artist_id
WHERE a.full_name = 'Pablo Picasso';

--  Retrieve museums that have more than 5 artworks

SELECT location.name AS museum_name, COUNT(museum_names.work_id) AS artwork_count
FROM museum_names
JOIN location ON museum_names.museum_id = location.museum_id
GROUP BY location.name
HAVING COUNT(museum_names.work_id) > 5;


--  Count the number of artworks in each museum

SELECT location.name AS museum_name, COUNT(museum_names.work_id) AS artwork_count
FROM museum_names
JOIN location ON museum_names.museum_id = location.museum_id
GROUP BY location.name;


--  Retrieve all artworks created by French artists

SELECT artist_info.full_name AS artist_name
FROM museum_names
JOIN artist_info ON museum_names.artist_id = artist_info.artist_id
WHERE artist_info.nationality = 'French';


--  Retrieve all museums that have at least one Impressionist artwork

SELECT DISTINCT location.name AS museum_name
FROM museum_names
JOIN location ON museum_names.museum_id = location.museum_id
WHERE museum_names.style = 'Impressionist';

-- Retrieve all artworks and their museums, even if they don’t have a museum assigned

SELECT location.name AS museum_name
FROM museum_names
LEFT JOIN location ON museum_names.museum_id = location.museum_id;

--  Retrieve all museums sorted by the number of artworks they contain, in descending order

SELECT location.name AS museum_name, COUNT(museum_names.work_id) AS artwork_count
FROM museum_names
JOIN location ON museum_names.museum_id = location.museum_id
GROUP BY location.name
ORDER BY artwork_count DESC;

-- Find all artists who lived for more than 80 years

SELECT full_name, birth, death, (death - birth) AS lifespan 
FROM artist_info 
WHERE (death - birth) > 80;







