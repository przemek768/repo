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
END IF;
SELECT hurtownie.nazwa_h, produkty.nazwa_p FROM hurtownie INNER JOIN produkty WHERE hurtownie.id_h = produkty.id_h;
UPDATE produkty SET produkty.ilosc_p = produkty.ilosc_p - NEW.ilosc
WHERE produkty.id_p = NEW.id_p;
INSERT INTO przedawnione_oferty VALUES (null, OLD.id_u, OLD.nazwa_o, OLD.id_p);