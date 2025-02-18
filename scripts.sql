-- create 
CREATE TABLE clientes (
  id SERIAL PRIMARY KEY,
  email VARCHAR(100) UNIQUE
);


CREATE TABLE facturas (
  id SERIAL PRIMARY KEY,
   cliente_id INT  REFERENCES clientes(id) 
   
);

CREATE TABLE productos (
id SERIAL PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
precio NUMERIC NOT NULL CHECK (precio > 10)
);

CREATE TABLE  envios (
  id SERIAL PRIMARY KEY,
   estado VARCHAR(50) CHECK (estado IN ('preparando', 'en tránsito', 'entregado'))
);




-- Inserciones válidas
INSERT INTO clientes (email) VALUES ('176412@upslp.edu.mx');
INSERT INTO clientes (email) VALUES ('173333@upslp.edu.mx');

SELECT *
FROM clientes; 

INSERT INTO facturas (cliente_id) VALUES (1);
INSERT INTO facturas (cliente_id) VALUES (2);

SELECT *
FROM facturas; 



INSERT INTO productos (nombre, precio) VALUES ('Laptop', 1000);
INSERT INTO productos (nombre, precio) VALUES ('Camiseta', 20);
SELECT *
FROM productos; 



INSERT INTO envios (estado) VALUES ('preparando');
INSERT INTO envios (estado) VALUES ('en tránsito');

SELECT *
FROM envios;
