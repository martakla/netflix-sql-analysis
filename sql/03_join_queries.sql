-- Jakie gatunki mają konkretne tytuły?

SELECT
    t.title,
    t.type,
    g.genre
FROM titles t
JOIN title_genres g
    ON t.show_id = g.show_id
ORDER BY t.title
LIMIT 20;


-- Jakie kraje są przypisane do filmów i seriali?

SELECT
    t.title,
    t.type,
    c.country
FROM titles t
JOIN title_countries c
    ON t.show_id = c.show_id
ORDER BY t.title
LIMIT 20;


-- Które gatunki najczęściej występują w filmach?

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


-- Które gatunki najczęściej występują w serialach?

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


-- Które kraje mają najwięcej filmów?

SELECT
    c.country,
    COUNT(*) AS total
FROM titles t
JOIN title_countries c
    ON t.show_id = c.show_id
WHERE t.type = 'Movie'
GROUP BY c.country
ORDER BY total DESC
LIMIT 10;


-- Które kraje mają najwięcej seriali?

SELECT
    c.country,
    COUNT(*) AS total
FROM titles t
JOIN title_countries c
    ON t.show_id = c.show_id
WHERE t.type = 'TV Show'
GROUP BY c.country
ORDER BY total DESC
LIMIT 10;


-- Którzy aktorzy pojawiają się najczęściej w produkcjach?

SELECT
    ca.actor,
    COUNT(*) AS total
FROM titles t
JOIN title_cast ca
    ON t.show_id = ca.show_id
GROUP BY ca.actor
ORDER BY total DESC
LIMIT 10;


-- Którzy reżyserzy pojawiają się najczęściej w filmach?

SELECT
    d.director,
    COUNT(*) AS total
FROM titles t
JOIN title_directors d
    ON t.show_id = d.show_id
WHERE t.type = 'Movie'
GROUP BY d.director
ORDER BY total DESC
LIMIT 10;