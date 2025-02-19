-- create table clientes (id, email)

CREATE TABLE clientes (
  Id_c SERIAL PRIMARY KEY,
  email VARCHAR(30) UNIQUE NOT NULL
  
);
CREATE TABLE facturas (
  Id_f SERIAL PRIMARY KEY,
  cliente_Id INT REFERENCES clientes(Id_c) NOT NULL
  
);

CREATE TABLE productos (
  Id_p SERIAL PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  precio NUMERIC CHECK (precio> 10)
);

CREATE TABLE envios(
  Id_e SERIAL PRIMARY KEY,
  Estado VARCHAR(20) CHECK (Estado IN ('preparando', 'en tránsito', 'entregado')) 

);







-- create table facturas (id, client_id)






-- create table productos (id, nombre, precio)






-- create table envios (id, fecha, estado)
