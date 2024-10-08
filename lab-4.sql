CREATE DATABASE lab4;

CREATE TABLE Warehouses (
    code SERIAL PRIMARY KEY,
    location VARCHAR(255),
    capacity INTEGER
);

CREATE TABLE Boxes (
    code CHAR(4),
    contents VARCHAR(255),
    value REAL,
    warehouse INTEGER REFERENCES Warehouses(code)
);

INSERT INTO Warehouses (location, capacity)
VALUES
    ('Chicago', 3),
    ('Chicago', 4),
    ('New York', 7),
    ('Los Angeles', 2),
    ('San Francisco', 8);

INSERT INTO Boxes (code, contents, value, warehouse)
VALUES
    ('0MN7', 'Rocks', 180, 3),
    ('4H8P', 'Rocks', 250, 1),
    ('4RT3', 'Scissors', 190, 4),
    ('7G3H', 'Rocks', 200, 1),
    ('8JN6', 'Papers', 75, 1),
    ('8Y6U', 'Papers', 50, 3),
    ('9J6F', 'Papers', 175, 2),
    ('LLO8', 'Rocks', 140, 4),
    ('P0H6', 'Scissors', 125, 1),
    ('P2T6', 'Scissors', 150, 2),
    ('TU55', 'Papers', 90, 5);

SELECT * FROM Warehouses;

SELECT * FROM Boxes WHERE value > 150;

SELECT DISTINCT contents FROM Boxes;

SELECT warehouse, COUNT(*) AS number_of_boxes
FROM Boxes
GROUP BY warehouse;

SELECT warehouse, COUNT(*) AS number_of_boxes
FROM Boxes
GROUP BY warehouse
HAVING COUNT(*) > 2;

INSERT INTO Warehouses (location, capacity)
VALUES ('New York', 3);

INSERT INTO Boxes (code, contents, value, warehouse)
VALUES ('H5RT', 'Papers', 200, 2);

UPDATE Boxes
SET value = value * 0.85
WHERE code = (
    SELECT code
    FROM Boxes
    ORDER BY value DESC
    LIMIT 1 OFFSET 2
);

DELETE FROM Boxes WHERE value < 150;

DELETE FROM Boxes
WHERE warehouse IN (
    SELECT code
    FROM Warehouses
    WHERE location = 'New York'
)
RETURNING *;
