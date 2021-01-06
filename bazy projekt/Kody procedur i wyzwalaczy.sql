DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `1`()
    NO SQL
SELECT hurtownie.nazwa_h, produkty.nazwa_p FROM hurtownie INNER JOIN produkty WHERE hurtownie.id_h = produkty.id_h$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `1`(`p0` INT(20)) RETURNS text CHARSET utf8mb4 COLLATE utf8mb4_polish_ci
    NO SQL
IF (
  SELECT
    COUNT(*)
  FROM
    produkty
  WHERE
    id_p = @p0
  AND
	ilosc_p = 0
) > 0 THEN RETURN "Brak produktu";ELSE RETURN "produktu sa jeszcze dostepne";
END IF$$
DELIMITER ;

CREATE TRIGGER `1` AFTER INSERT ON `sprzedaz`
 FOR EACH ROW UPDATE produkty SET produkty.ilosc_p = produkty.ilosc_p - NEW.ilosc
WHERE produkty.id_p = NEW.id_p;

CREATE TRIGGER `2` BEFORE DELETE ON `oferta`
 FOR EACH ROW INSERT INTO przedawnione_oferty VALUES (null, OLD.id_u, OLD.nazwa_o, OLD.id_p);