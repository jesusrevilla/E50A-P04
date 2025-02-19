-- create table clientes (id, email)
CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    email VARCHAR(30) NOT NULL UNIQUE
);

-- create table facturas (id, cliente_id)
CREATE TABLE facturas(
    id SERIAL PRIMARY KEY,
    cliente_id INTEGER NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes (id)
);

-- create table productos (id, nombre, precio)
CREATE TABLE productos(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    precio NUMERIC CHECK(precio > 10)
);

-- create table envios (id, fecha, estado)
CREATE TABLE envios (
    id SERIAL PRIMARY KEY,
    fecha DATE,
    estado VARCHAR CHECK(estado IN ('preparando', 'en tránsito', 'entregado'))
);
