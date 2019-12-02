USE ddsi;

create TRIGGER dni_unico
before INSERT or UPDATE ON Empleado
FOR EACH ROW
    DECLARE 
        dni_unico EXCEPTION;
    BEGIN
    IF NOT EXISTS (SELECT * FROM Empleado AS e WHERE e.DNI =:new.DNI)
    THEN
        RAISE dni_unico;
    END_IF;
