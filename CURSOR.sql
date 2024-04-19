DELIMITER //

CREATE PROCEDURE MostrarUsuarios(INOUT NombreCom varchar(4000))
BEGIN
    -- Declarar las variables para almacenar los datos de la fila actual
    DECLARE nombre_usuarios VARCHAR(50);
    DECLARE apellido_usuarios VARCHAR(50);
	DECLARE finished integer default 0;
	DECLARE nombres_concatenados VARCHAR(4000) DEFAULT '';

    -- Declarar el cursor
    DECLARE cursor_usuarios CURSOR FOR
        SELECT Nombre, apellido FROM usuarios;
          -- Manejar la excepción NOT FOUND
    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET finished = 1;
    
    
    -- Abrir el cursor
    OPEN cursor_usuarios;
        set NombreCom = "";

    -- Recorrer las filas y mostrar los datos
    usuarios_loop: LOOP
        -- Leer los valores de la fila actual en las variables
        FETCH cursor_usuarios INTO nombre_usuarios, apellido_usuarios;
        
        -- Salir del bucle si no hay más filas
        IF finished=1 THEN
            LEAVE usuarios_loop;
        END IF;
        
   
		SET nombres_concatenados = CONCAT(nombres_concatenados, nombre_usuarios, ' ', apellido_usuarios, '; ');
        
    END LOOP;
    -- Asignar el resultado a la variable de salida
    SET NombreCom = nombres_concatenados;
    -- Cerrar el cursor
    CLOSE cursor_usuarios;
END //

DELIMITER ;

CALL MostrarUsuarios(@NombreCom);

