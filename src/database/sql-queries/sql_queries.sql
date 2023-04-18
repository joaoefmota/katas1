SHOW TABLES;
/* 1. Select all restaurant's name */
SELECT * FROM restaurant; 
/* 2. Select all menu's title alphabetically */
SELECT title FROM menu 
ORDER BY title ASC; 
/* 3. Select each dish's name and price, in decreasing price order */
SELECT name, price FROM dish 
ORDER BY price DESC; 
/* 4. Select restaurant's name located in the city of Paris */
SELECT name FROM restaurant 
WHERE city="Paris";
/* 5. Select all menu's title which contains the word "menu" */
SELECT title FROM menu 
WHERE title 
LIKE "%menu%";
/* 6. Select cities without duplicates */
SELECT city FROM restaurant 
GROUP BY city 
HAVING COUNT (*)=1;
/* 7. Select the name of the most expensive dish */
SELECT name, price FROM dish 
ORDER BY price 
DESC LIMIT 1;
/* 8. Select all menu's title and the restaurant's name where they are sold */
SELECT m.title AS menu_title, r.name AS restaurant FROM menu AS m 
INNER JOIN restaurant AS r ON r.id=m.restaurant_id;
/* 9. Select all dish's name (without duplicate) which are contained by at least one menu */ 
SELECT DISTINCT d.name AS dish, m.title AS menu FROM dish AS d
INNER JOIN menu_dish AS md
ON d.id=md.dish_id
JOIN menu AS m
ON m.id=md.menu_id;
/* 10. Select all dish's name and price with corresponding menu's title */
SELECT d.name AS dish, d.price AS price, m.title AS menu FROM dish AS d
INNER JOIN menu_dish AS md
ON d.id = md.dish_id 
JOIN menu AS m
ON m.id = md.menu_id;
/* 11. Select each dish's name and price, corresponding menu's title and restaurant's name who sells it */
SELECT d.name AS dish, d.price AS price, m.title AS menu, r.name AS restaurant
FROM dish AS d
INNER JOIN menu_dish AS md
ON d.id = md.dish_id
JOIN menu AS m
ON m.id = md.menu_id
JOIN restaurant AS r
ON r.id = m.restaurant_id;
/* 12. Select all the restaurants' name which don't sell any menu */
SELECT r.name AS restaurant, m.title AS menu
FROM restaurant AS r 
JOIN menu AS m
ON r.id = m.restaurant_id 
WHERE m.title NOT LIKE "%menu%";
/* 13. Select all dish's name not contained in any menu */
SELECT d.name AS dish, m.title AS menu
FROM dish AS d
INNER JOIN menu_dish AS md
ON d.id = md.dish_id
JOIN menu AS m
ON m.id = md.menu_id
WHERE m.title NOT LIKE "%menu%";
/* 14. Select each city's name and how many restaurants located in this city */
SELECT city, COUNT (*) AS total 
FROM restaurant
GROUP BY city
ORDER BY total DESC;
/* 16. Select the title of the menu with the most dishes */
SELECT m.title AS menu, COUNT (*) AS total_dishes
FROM menu AS m
INNER JOIN menu_dish AS md
ON m.id = md.menu_id
JOIN dish AS d
ON d.id = md.dish_id
GROUP BY m.title
ORDER BY total_dishes
DESC LIMIT 1;
/* 17. Select, for each restaurant, its name and how many menus it sells (some restaurants might not have any menu) */

;
SELECT * FROM restaurant;
 SELECT * FROM menu;
SELECT * FROM dish;
SELECT * FROM menu_dish;