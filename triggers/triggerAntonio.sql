USE ddsi;

delimiter //

DROP TRIGGER IF EXISTS checkStock;
CREATE TRIGGER checkStock BEFORE INSERT ON Producto
FOR EACH ROW
BEGIN
    IF NEW.stock > NEW.limiteAlmacenamiento THEN
      signal sqlstate '45000' SET message_text = 'El stock no puede superar al limite de almacenamiento';
    END IF;
END;//
delimiter ;