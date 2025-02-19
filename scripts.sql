-- create table clientes (id, email)

CREATE TABLE clientes (
  id SERIAL PRIMARY KEY,
  email VARCHAR(50) UNIQUE NOT NULL
);

-- create table facturas (id, client_id)

CREATE TABLE facturas(
  id SERIAL PRIMARY KEY,
  cliente_id SERIAL,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- create table productos (id, nombre, precio)

CREATE TABLE productos (
  id  SERIAL PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL, 
  precio NUMERIC CHECK (precio > 0)
);

-- create table envios (id, fecha, estado)

CREATE TABLE envios (
  id SERIAL PRIMARY KEY,
  fecha DATE,
  estado VARCHAR(30) CHECK (estado IN  ('preparando', 'en tránsito', 'entregado')) 
);
