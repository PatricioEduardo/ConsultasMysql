-- Consulta para obtener el nombre de la moneda elegida por un usuario específico
SELECT m.currency_name
FROM transacciones t
JOIN moneda m ON t.currency_id = m.currency_id
WHERE t.sender_user_id = 1 OR t.receiver_user_id = 1;

-- Consulta para obtener todas las transacciones registradas
SELECT 
    t.transaccion_id,
    t.sender_user_id,
    sender.nombre AS sender_nombre,
    t.receiver_user_id,
    receiver.nombre AS receiver_nombre,
    t.monto,
    m.currency_name,
    m.currency_symbol,
    t.fecha
FROM 
    transacciones t
    JOIN usuarios sender ON t.sender_user_id = sender.user_id
    JOIN usuarios receiver ON t.receiver_user_id = receiver.user_id
    JOIN moneda m ON t.currency_id = m.currency_id;

-- Consulta para obtener todas las transacciones realizadas por un usuario específico
SELECT 
    t.transaccion_id,
    t.sender_user_id,
    sender.nombre AS sender_nombre,
    t.receiver_user_id,
    receiver.nombre AS receiver_nombre,
    t.monto,
    m.currency_name,
    m.currency_symbol,
    t.fecha
FROM 
    transacciones t
    JOIN usuarios sender ON t.sender_user_id = sender.user_id
    JOIN usuarios receiver ON t.receiver_user_id = receiver.user_id
    JOIN moneda m ON t.currency_id = m.currency_id
WHERE
    sender.user_id = 2 OR receiver.user_id = 2;

-- Sentencia DML para modificar el campo correo electrónico de un usuario específico
UPDATE usuarios
SET email = 'nuevo_correo@example.com'
WHERE user_id = 3;

-- Sentencia para eliminar los datos de una transacción (eliminado de la fila completa)
DELETE FROM transacciones
WHERE transaccion_id = 4;
