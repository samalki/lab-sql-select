

SELECT 
    a.au_id AS "AUTHOR ID", 
    a.au_lname AS "LAST NAME", 
    a.au_fname AS "FIRST NAME", 
    t.title AS "TITLE", 
    p.pub_name AS "PUBLISHER"
FROM 
    authors a
JOIN 
    titleauthor ta ON a.au_id = ta.au_id
JOIN 
    titles t ON ta.title_id = t.title_id
JOIN 
    publishers p ON t.pub_id = p.pub_id;



SELECT 
    a.au_id AS "AUTHOR ID", 
    a.au_lname AS "LAST NAME", 
    a.au_fname AS "FIRST NAME", 
    p.pub_name AS "PUBLISHER", 
    COUNT(t.title) AS "TITLE COUNT"
FROM 
    authors a
JOIN 
    titleauthor ta ON a.au_id = ta.au_id
JOIN 
    titles t ON ta.title_id = t.title_id
JOIN 
    publishers p ON t.pub_id = p.pub_id
GROUP BY 
    a.au_id, a.au_lname, a.au_fname, p.pub_name;



SELECT 
    a.au_id AS "AUTHOR ID", 
    a.au_lname AS "LAST NAME", 
    a.au_fname AS "FIRST NAME", 
    SUM(t.ytd_sales) AS "TOTAL"
FROM 
    authors a
JOIN 
    titleauthor ta ON a.au_id = ta.au_id
JOIN 
    titles t ON ta.title_id = t.title_id
GROUP BY 
    a.au_id, a.au_lname, a.au_fname
ORDER BY 
    "TOTAL" DESC
LIMIT 3;



SELECT 
    a.au_id AS "AUTHOR ID", 
    a.au_lname AS "LAST NAME", 
    a.au_fname AS "FIRST NAME", 
    COALESCE(SUM(t.ytd_sales), 0) AS "TOTAL"
FROM 
    authors a
LEFT JOIN 
    titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN 
    titles t ON ta.title_id = t.title_id
GROUP BY 
    a.au_id, a.au_lname, a.au_fname
ORDER BY 
    "TOTAL" DESC;

