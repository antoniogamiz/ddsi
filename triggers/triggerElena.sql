USE ddsi;

delimiter //

DROP TRIGGER IF EXISTS dni_no_unico;
CREATE TRIGGER dni_no_unico BEFORE INSERT ON Empleado
FOR EACH ROW
    BEGIN
    IF EXISTS (SELECT * FROM Empleado AS e WHERE e.DNI = NEW.DNI) THEN
        signal sqlstate '45000' SET message_text = 'No puede dos empleados con el mismo DNI';
    END IF;
END;//

delimiter ;