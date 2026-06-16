-- Jaki typ treści dominuje w zbiorze w %?

SELECT
    type,
    COUNT(*) AS total,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM titles), 2) AS percentage
FROM titles
GROUP BY type
ORDER BY total DESC;


-- Jakie są najpopularniejsze gatunki w całym zbiorze?

SELECT
    genre,
    COUNT(*) AS total
FROM title_genres
GROUP BY genre
ORDER BY total DESC
LIMIT 10;


-- Jakie kraje pojawiają się najczęściej w danych?

SELECT
    country,
    COUNT(*) AS total
FROM title_countries
GROUP BY country
ORDER BY total DESC
LIMIT 10;


-- W których latach wydano najwięcej produkcji?

SELECT
    release_year,
    COUNT(*) AS total
FROM titles
GROUP BY release_year
ORDER BY total DESC
LIMIT 10;


-- Ile produkcji dodano do Netflixa w poszczególnych latach?

SELECT
    strftime('%Y', date_added) AS added_year,
    COUNT(*) AS total
FROM titles
WHERE date_added IS NOT NULL
GROUP BY added_year
ORDER BY added_year DESC;


-- Jak wygląda udział filmów i seriali dodanych po 2015 roku?

SELECT
    type,
    COUNT(*) AS total
FROM titles
WHERE release_year >= 2015
GROUP BY type
ORDER BY total DESC;


-- Jakie gatunki są najczęstsze dla filmów?

SELECT
    g.genre,
    COUNT(*) AS total
FROM titles t
JOIN title_genres g
    ON t.show_id = g.show_id
WHERE t.type = 'Movie'
GROUP BY g.genre
ORDER BY total DESC
LIMIT 10;


-- Jakie gatunki są najczęstsze dla seriali?

SELECT
    g.genre,
    COUNT(*) AS total
FROM titles t
JOIN title_genres g
    ON t.show_id = g.show_id
WHERE t.type = 'TV Show'
GROUP BY g.genre
ORDER BY total DESC
LIMIT 10;