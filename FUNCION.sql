DELIMITER //

CREATE PROCEDURE ObtenerUsuariosMayoresDeEdad (
    IN p_fechaLimite DATE
)
BEGIN
    SELECT * FROM usuarios WHERE fechaN <= p_fechaLimite;
END //

DELIMITER ;

CALL ObtenerUsuariosMayoresDeEdad('2005-01-01');
