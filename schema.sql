CREATE DATABASE estoque_db;

USE estoque_db;

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100),
    categoria VARCHAR(50),
    preco DECIMAL(10,2),
    quantidade INT
);
