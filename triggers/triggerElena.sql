USE ddsi;

create TRIGGER dni_no_unico
before INSERT or UPDATE ON Empleado
FOR EACH ROW
    DECLARE 
        dni_unico EXCEPTION;
        PRAGMA EXCEPTION_INIT (dni_no_unico, -1);
    BEGIN
    IF EXISTS (SELECT * FROM Empleado AS e WHERE e.DNI =:new.DNI)
    THEN
        RAISE dni_no_unico;
    END_IF;
    
    EXCEPTION
        WHEN dni_no_unico THEN
            DBMS_OUTPUT.PUT_LINE (“Error: ya hay un empleado con ese DNI en el sistema”); 
            RAISE DUP_VAL_ON_INDEX;
        END;
END;
