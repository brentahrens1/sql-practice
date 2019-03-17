DROP TABLE IF EXISTS products;

CREATE TABLE products (
  id SERIAL primary key,
  name VARCHAR(255),
  price NUMERIC NOT NULL DEFAULT 'NaN',
  quantity INTEGER NOT NULL DEFAULT 0
);

INSERT INTO products 
    (name, price, quantity)
    VALUES
    ('bookmark', 0.50, 200); 

INSERT INTO products 
    (name, price, quantity)
    VALUES
    ('book cover', 2.00, 75); 

INSERT INTO products 
    (name, price, quantity)
    VALUES
    ('book bag', 60.00, 15); 
INSERT INTO products 
    (name, price, quantity)
    VALUES
    ('reading light', 25.00, 10); 

    SELECT * FROM products;

    SELECT name, price FROM products;

    SELECT name FROM products ORDER BY price;

    SELECT * FROM products
    WHERE name = 'bookmark';

    SELECT * FROM products
    WHERE price > 20.00
    ORDER BY price;

    SELECT * FROM products
    WHERE name LIKE 'book%';

    UPDATE products
        SET quantity = quantity - 1 
        WHERE name = 'bookmark'
        RETURNING *;

    UPDATE products
        SET name = 'bookbag'
        WHERE name = 'book bag'; 

    DELETE FROM products 
        WHERE name = 'book cover'
        RETURNING *; 

    DELETE FROM products 
        WHERE name <> 'bookmark'; 

    DELETE FROM products; 

SELECT * FROM products 
    AS prod 
    WHERE prod.name = 'bookmark'; 

INSERT INTO products 
    (name, price, quantity)
    VALUES('bookbag', 50.00, 20),
    ('bookbag', 65.00, 10); 

SELECT DISTINCT ON (name) *
    FROM products; 

SELECT SUM(quantity) AS total_inventory_ from products; 

SELECT name, MIN(price) AS lowest_available_price
FROM products 
GROUP BY name
ORDER BY lowest_available_price; 



-- CREATE TABLE author (
--   id SERIAL primary key,
--   firstName VARCHAR(255),
--   year_of_birth INTEGER, /* also known as yob */
--   year_of_death NUMERIC DEFAULT 'NaN',
--   description TEXT,
--   created_at TIMESTAMP NOT NULL DEFAULT now()
-- );

-- ALTER TABLE author ADD COLUMN last_name VARCHAR(255); 
-- ALTER TABLE author DROP COLUMN description; 
-- ALTER TABLE author RENAME to authors; 
-- ALTER TABLE authors RENAME COLUMN firstName TO first_name; 
-- DROP TABLE authors; 
