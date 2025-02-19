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
