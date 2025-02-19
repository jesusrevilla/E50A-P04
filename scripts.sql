--Universidad Politécnica de San Luis Potosí
--          13 de Febrero, 2025
--            Base de Datos
--    Christian Alejandro Cárdenas Rucoba


--1. Ejercicio 1: Crea una tabla clientes con una clave primaria id y una columna email que debe 
--ser única.
-- create table clientes (id, email)
CREATE TABLE CLIENTES(
  id SERIAL PRIMARY KEY,
  email VARCHAR(100) UNIQUE
);

--2. Ejercicio 2: Crea una tabla facturas que tenga una clave foránea cliente_id que referencie a la 
--tabla clientes.
-- create table facturas (id, client_id)
CREATE TABLE FACTURAS(
  id SERIAL,
  cliente_id INT,
  FOREIGN KEY (cliente_id) REFERENCES CLIENTES(id)
);

--3. Ejercicio 3: Añade una restricción a la tabla productos para que el nombre no pueda ser nulo 
--y el precio debe ser mayor a 10.
-- create table productos (id, nombre, precio)
CREATE TABLE PRODUCTOS(
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio NUMERIC NOT NULL CHECK(precio > 10)
);

--4. Ejercicio 4: Crea una tabla envios con una columna estado que solo pueda tener los valores 
--'preparando', 'en tránsito' o 'entregado'.
-- create table envios (id, fecha, estado)
CREATE TABLE ENVIOS(
  id SERIAL PRIMARY KEY,
  fecha DATE,
  estado VARCHAR 
);

-- Ejercicio 1 tabla clientes

-- Prueba para verificar que el email debe ser único
DO $$
BEGIN
    BEGIN
        INSERT INTO clientes (email) VALUES ('test@example.com');
        INSERT INTO clientes (email) VALUES ('test@example.com');
    EXCEPTION WHEN unique_violation THEN
        RAISE NOTICE 'Error esperado: %', SQLERRM;
    END;
END $$;


-- Ejercicio 2 tabla facturas

-- Prueba para verificar la integridad referencial
DO $$
BEGIN
    BEGIN
        -- Inserción válida
        INSERT INTO clientes (email) VALUES ('juan@example.com');
        INSERT INTO facturas (cliente_id) VALUES (1);

        -- Esta inserción debería fallar porque no existe el cliente_id 2
        INSERT INTO facturas (cliente_id) VALUES (2);
    EXCEPTION WHEN foreign_key_violation THEN
        RAISE NOTICE 'Error esperado: %', SQLERRM;
    END;
END $$;


-- Ejercicio 3 Restricciones en productos

-- Prueba unitaria para verificar que el nombre no sea nulo y el precio mayor a 10
-- Prueba para verificar que el nombre no puede ser nulo
DO $$
BEGIN
    BEGIN
        -- Esta inserción debería fallar porque el nombre es nulo
        INSERT INTO productos (nombre, precio) VALUES (NULL, 20);
    EXCEPTION WHEN not_null_violation THEN
        RAISE NOTICE 'Error esperado: %', SQLERRM;
    END;
END $$;

-- Prueba para verificar que el precio debe ser mayor que 10
DO $$
BEGIN
    BEGIN
        -- Esta inserción debería fallar porque el precio es menor o igual a 10
        INSERT INTO productos (nombre, precio) VALUES ('Producto1', 5);
    EXCEPTION WHEN check_violation THEN
        RAISE NOTICE 'Error esperado: %', SQLERRM;
    END;
END $$;

-- Ejercicio 4 Tabla envios

-- Prueba para verificar valores permitidos en estado
DO $$
BEGIN
    BEGIN
        -- Inserciones válidas
        INSERT INTO envios (estado) VALUES ('preparando');
        INSERT INTO envios (estado) VALUES ('en tránsito');
        INSERT INTO envios (estado) VALUES ('entregado');
        
        -- Esta inserción debería fallar porque el estado no es permitido
        INSERT INTO envios (estado) VALUES ('cancelado');
    EXCEPTION WHEN check_violation THEN
        RAISE NOTICE 'Error esperado: %', SQLERRM;
    END;
END $$;
