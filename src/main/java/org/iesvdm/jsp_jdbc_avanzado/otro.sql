USE baloncesto;
CREATE TABLE entrenamiento (
                               id INT AUTO_INCREMENT PRIMARY KEY,
                               tipo VARCHAR(50) NOT NULL,
                               ubicacion VARCHAR(100) NOT NULL,
                               fecha DATE NOT NULL
);
