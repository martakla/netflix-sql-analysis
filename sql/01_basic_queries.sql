-- Podgląd danych z głównej tabeli

SELECT *
FROM titles
LIMIT 10;


-- Ile tytułów znajduje się w bazie?

SELECT COUNT(*) AS total_titles
FROM titles;


-- Ile jest filmów, a ile seriali?

SELECT type, COUNT(*) AS total
FROM titles
GROUP BY type
ORDER BY total DESC;


-- Z jakich lat pochodzą najstarsze i najnowsze produkcje?

SELECT
    MIN(release_year) AS oldest_release_year,
    MAX(release_year) AS newest_release_year
FROM titles;


-- Jakie ratingi występują najczęściej?

SELECT rating, COUNT(*) AS total
FROM titles
WHERE rating IS NOT NULL
GROUP BY rating
ORDER BY total DESC;