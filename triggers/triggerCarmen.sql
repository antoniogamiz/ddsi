USE ddsi;

DELIMITER |
CREATE TRIGGER dni_validoINSERT BEFORE INSERT ON Reserva
  FOR EACH ROW
  BEGIN
 	IF NOT EXISTS (SELECT * FROM Cliente as cliente WHERE cliente.DNI = NEW.DNI) THEN
		signal sqlstate '45000' SET message_text = 'No se ha podido realizar la reserva, no es un cliente todavía';
    END IF;
  END |
DELIMITER ;

DELIMITER |
CREATE TRIGGER unica_reserva BEFORE INSERT ON Reserva
  FOR EACH ROW
  BEGIN
    IF EXISTS (SELECT * FROM Reserva as reserva WHERE (reserva.DNI = NEW.DNI AND reserva.fecha=NEW.fecha AND reserva.hora=NEW.hora)) THEN
		signal sqlstate '45000' SET message_text = 'Ya hay una reserva a la misma hora y día';
    END IF;
  END |
DELIMITER ;
