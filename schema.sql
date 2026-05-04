DROP DATABASE IF EXISTS estoque_db;

CREATE DATABASE estoque_db;
USE estoque_db;

-- ======================
-- TABELA CLIENTES
-- ======================

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    endereco VARCHAR(200) NOT NULL
);

-- ======================
-- TABELA FORNECEDORES
-- ======================

CREATE TABLE fornecedores (
    id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    nome_fornecedor VARCHAR(100) NOT NULL,
    contato VARCHAR(100) NOT NULL
);

-- ======================
-- TABELA CATEGORIAS
-- ======================

CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(100) NOT NULL
);

-- ======================
-- TABELA PRODUTOS
-- ======================

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    preco DECIMAL(10,2) NOT NULL,
    quantidade INT NOT NULL,
    categoria_id INT NOT NULL,
    fornecedor_id INT NOT NULL,

    FOREIGN KEY (categoria_id) REFERENCES categorias(id_categoria),
    FOREIGN KEY (fornecedor_id) REFERENCES fornecedores(id_fornecedor)
);

-- ======================
-- INSERT CATEGORIAS
-- ======================

INSERT INTO categorias (nome_categoria) VALUES
('Smartphones'),
('Notebooks'),
('Tablets'),
('Monitores'),
('Perifericos');

-- ======================
-- INSERT FORNECEDORES
-- ======================

INSERT INTO fornecedores (nome_fornecedor, contato) VALUES
('Tech Distribuidora', 'tech@email.com'),
('Info Supply', 'supply@email.com'),
('Hardware Plus', 'hardware@email.com');

-- ======================
-- INSERT CLIENTES
-- ======================

INSERT INTO clientes (nome_cliente, email, endereco) VALUES
('Patricia Lima', 'patricia@email.com', 'Rua das Flores'),
('Rodrigo Almeida', 'rodrigo@email.com', 'Avenida Central'),
('Andre Oliveira', 'andre@email.com', 'Travessa do Sol');

-- ======================
-- INSERT PRODUTOS
-- ======================

INSERT INTO produtos 
(nome_produto, descricao, preco, quantidade, categoria_id, fornecedor_id)
VALUES
('Smartphone X', 'Smartphone de ultima geracao', 699.99, 10, 1, 1),
('Notebook Pro', 'Notebook de alta performance', 1199.99, 5, 2, 2),
('Tablet Lite', 'Tablet compacto e leve', 299.99, 15, 3, 3),
('Monitor Gamer', 'Monitor Full HD 144hz', 899.99, 8, 4, 1),
('Mouse Gamer', 'Mouse RGB', 149.99, 20, 5, 2);

-- ======================
-- CONSULTAS
-- ======================

SELECT * FROM produtos;

SELECT nome_produto, preco
FROM produtos
WHERE preco > 500;

SELECT nome_produto, quantidade
FROM produtos
WHERE quantidade < 10;

-- ======================
-- ATUALIZACOES
-- ======================

UPDATE produtos
SET quantidade = 25
WHERE id_produto = 5;

UPDATE clientes
SET endereco = 'Avenida Paulista'
WHERE id_cliente = 1;

-- ======================
-- REMOCOES
-- ======================

DELETE FROM produtos
WHERE id_produto = 3;
