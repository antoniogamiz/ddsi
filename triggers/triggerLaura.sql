USE ddsi;

DELIMITER |

CREATE TRIGGER noExisteIngrediente BEFORE INSERT ON Ingrediente
  FOR EACH ROW
  BEGIN
 	IF NOT EXISTS (SELECT * FROM Producto as a WHERE a.nombre = NEW.nombre) THEN
		signal sqlstate '45000' SET message_text = 'El ingrediente no se encuentra disponible. Plato añadido sin el ingrediente';
	END IF;
END |
DELIMITER ;
