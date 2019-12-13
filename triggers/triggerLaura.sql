USE ddsi;

DELIMITER |
DROP TRIGGER IF EXISTS noExisteIngrediente
CREATE TRIGGER noExisteIngrediente BEFORE INSERT ON Plato
  FOR EACH ROW
  BEGIN
 	IF NOT EXISTS (SELECT * FROM Producto as a WHERE a.nombre = NEW.ingredient) THEN
		signal sqlstate '45000' SET message_text = 'El ingrediente no se encuentra disponible';
END;//
DELIMITER ;
