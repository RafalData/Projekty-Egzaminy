CREATE TABLE zakupy (
    zakup_id INT PRIMARY KEY AUTO_INCREMENT
    ,paragon_id INT
    ,sklep VARCHAR(50)
    ,produkt VARCHAR(200) NOT NULL
    ,kategoria VARCHAR(50) NOT NULL
    ,podkategoria VARCHAR(50)
    ,data DATE NOT NULL
    ,kwota DECIMAL(10,2) NOT NULL
    ,ilosc DECIMAL(10,3) NOT NULL
    ,jednostka VARCHAR(5) NOT NULL DEFAULT 'szt' CHECK (jednostka IN ('szt', 'kg', 'l'))
    ,rabat DECIMAL(10,2) NOT NULL DEFAULT 0 CHECK (rabat >= 0)
    ,zaplacono DECIMAL(10,2) AS (kwota - rabat) STORED
);
