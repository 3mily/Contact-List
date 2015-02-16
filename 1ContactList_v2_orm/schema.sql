CREATE TABLE "contacts" (
  "id" serial NOT NULL PRIMARY KEY,
  "firstname" varchar(50) NOT NULL,
  "lastname" varchar(50) NOT NULL,
  "email" varchar(300) UNIQUE NOT NULL # contraints
  -- "phone" varchar(25)
);



CREATE TABLE "phones" (
        -- "id" serial NOT NULL 
        "contact_id" int NOT NULL REFERENCES contacts(id),
        "type" varchar(100)
        "number" varchar(50)
);


ALTER TABLE phones ALTER COLUMN number TYPE int USING 

ADD COLUMN "contact_id" int NOT NULL REFERENCES contacts(id);


-- ALTER TABLE contacts DROP COLUMN phone;

ALTER TABLE phones DROP COLUMN contact_id;

ALTER TABLE phones DROP CONSTRAINT NOT NULL;

ALTER TABLE phones ALTER COLUMN type DROP not null;

-- ALTER TABLE contacts ADD UNIQUE (email);



-- #order for SQL
-- SELECT
-- FROM
-- WHERE #condition
--  JOIN table_name ON #another condition
-- GROUP BY #column or expression (expression is like SUM(column))
-- HAVING # like where, on aggrigate (aggrigate in group by) (HAVING SUM(column) = 5)
-- ORDER BY

-- OFFSET number # "next five"
-- LIMIT number

-- #Aggrigate function (SUM, AVG) always need GROUP BY