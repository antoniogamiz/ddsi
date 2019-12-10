USE ddsi;

DELIMITER |
DROP TRIGGER IF EXISTS checkProductLimitINSERT |
CREATE TRIGGER  BEFORE checkProductLimitINSERT INSERT ON Producto
  FOR EACH ROW
  BEGIN
    CALL checkProductLimit(NEW.stock,NEW.limiteAlmacenamiento);
  END |
DELIMITER ;

DELIMITER |
DROP PROCEDURE IF EXISTS checkProductLimit |
CREATE PROCEDURE checkProductLimit(IN stock INT, IN limiteAlmacenamiento INT)
READS SQL DATA
  BEGIN
    DECLARE msg varchar(124);
    IF stock >= limiteAlmacenamiento THEN
      SET msg = 'Error: El stock no puede superar al limite de almacenamiento"';
      SIGNAL SQLSTATE '45000' SET message_text = msg;
    END IF;
  END |
DELIMITER ;
