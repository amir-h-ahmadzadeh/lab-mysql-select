USE publications;

-- FIRST CHALLENGE

SELECT 
		authors.au_id AS "AUTHOR ID", 
        authors.au_lname AS "LAST NAME", 
        authors.au_fname AS "FIRST NAME",
        title AS "TITLE",
        type "TYPE",
        pub_name "PUBLICATION"
FROM	
		authors
JOIN 
		titleauthor USING(au_id)
JOIN 
		titles USING(title_id)
JOIN 
		publishers USING(pub_id);
        
        
-- SECOND CHALLENGE

DROP VIEW IF EXISTS author_publications;
CREATE VIEW author_publications AS 
SELECT 
		authors.au_id AS "AUTHOR_ID", 
        authors.au_lname AS "LAST_NAME", 
        authors.au_fname AS "FIRST_NAME",
        title AS "TITLE",
        type "TYPE",
        pub_name "PUBLICATION"
FROM	
		authors
JOIN 
		titleauthor USING(au_id)
JOIN 
		titles USING(title_id)
JOIN 
		publishers USING(pub_id);
        
        
SELECT 
		AUTHOR_ID,
        LAST_NAME,
        FIRST_NAME,
        PUBLICATION,
        COUNT(TITLE) AS "TITLE COUNT"
FROM 
	   author_publications
GROUP BY
	   AUTHOR_ID, PUBLICATION
ORDER BY COUNT(TITLE) DESC;
      
-- THIRD CHALLENGE

 
SELECT 
		authors.au_id AS "AUTHOR_ID", 
        authors.au_lname AS "LAST_NAME", 
        authors.au_fname AS "FIRST_NAME",
        SUM(ytd_sales) AS "TOTAL"
FROM	
		authors
JOIN 
		titleauthor USING(au_id)
JOIN 
		titles USING(title_id)
GROUP BY 
		AUTHOR_ID,LAST_NAME,FIRST_NAME
ORDER BY TOTAL DESC
LIMIT 3;
        

-- FOURTH CHALLENGE

 SELECT 
		authors.au_id AS "AUTHOR_ID", 
        authors.au_lname AS "LAST_NAME", 
        authors.au_fname AS "FIRST_NAME",
        SUM(ytd_sales) AS "TOTAL"
FROM	
		authors
JOIN 
		titleauthor USING(au_id)
JOIN 
		titles USING(title_id)
GROUP BY 
		AUTHOR_ID,LAST_NAME,FIRST_NAME
ORDER BY TOTAL DESC;       
