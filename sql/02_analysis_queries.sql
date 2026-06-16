-- Jakie gatunki pojawiają się najczęściej?

SELECT genre, COUNT(*) AS total
FROM title_genres
GROUP BY genre
ORDER BY total DESC
LIMIT 10;


-- Które kraje mają najwięcej produkcji w zbiorze?

SELECT country, COUNT(*) AS total
FROM title_countries
GROUP BY country
ORDER BY total DESC
LIMIT 10;


-- W których latach wydano najwięcej produkcji?

SELECT release_year, COUNT(*) AS total
FROM titles
GROUP BY release_year
ORDER BY total DESC
LIMIT 10;


-- Jak wygląda liczba filmów i seriali według roku wydania?

SELECT release_year, type, COUNT(*) AS total
FROM titles
GROUP BY release_year, type
ORDER BY release_year DESC, type;


-- Którzy reżyserzy pojawiają się najczęściej?

SELECT director, COUNT(*) AS total
FROM title_directors
GROUP BY director
ORDER BY total DESC
LIMIT 10;


-- Jakie ratingi są najczęstsze dla filmów?

SELECT rating, COUNT(*) AS total
FROM titles
WHERE type = 'Movie'
  AND rating IS NOT NULL
GROUP BY rating
ORDER BY total DESC;


-- Jakie ratingi są najczęstsze dla seriali?

SELECT rating, COUNT(*) AS total
FROM titles
WHERE type = 'TV Show'
  AND rating IS NOT NULL
GROUP BY rating
ORDER BY total DESC;