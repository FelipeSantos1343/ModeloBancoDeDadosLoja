/* loja_logico: */

CREATE TABLE CLIENTE (
    id_cliente INTEGER PRIMARY KEY,
    cpf VARCHAR UNIQUE,
    nome VARCHAR
);

CREATE TABLE VENDA (
    id_venda INTEGER PRIMARY KEY,
    iid_cliente INTEGER,
    id_funcionario INTEGER,
    preco_total INTEGER,
    nota_fiscal VARCHAR,
    data DATE
);

CREATE TABLE FUNCIONARIO (
    id_funcionario INTEGER PRIMARY KEY,
    nome VARCHAR,
    cpf VARCHAR UNIQUE,
    data_nascimento DATE,
    data_contratacao DATE,
    cargo VARCHAR,
    salario VARCHAR
);

CREATE TABLE LISTA_PRODUTOS (
    id_produto INTEGER,
    id_venda INTEGER,
    quantidade INTEGER
);

CREATE TABLE PRODUTO (
    id_produto INTEGER PRIMARY KEY,
    nome VARCHAR,
    preco INTEGER,
    quantidade INTEGER,
    descricao VARCHAR
);
 
ALTER TABLE VENDA ADD CONSTRAINT FK_VENDA_2
    FOREIGN KEY (iid_cliente)
    REFERENCES CLIENTE (id_cliente)
    ON DELETE RESTRICT;
 
ALTER TABLE VENDA ADD CONSTRAINT FK_VENDA_3
    FOREIGN KEY (id_funcionario)
    REFERENCES FUNCIONARIO (id_funcionario)
    ON DELETE RESTRICT;
 
ALTER TABLE LISTA_PRODUTOS ADD CONSTRAINT FK_LISTA_PRODUTOS_1
    FOREIGN KEY (id_produto)
    REFERENCES PRODUTO (id_produto)
    ON DELETE CASCADE;
 
ALTER TABLE LISTA_PRODUTOS ADD CONSTRAINT FK_LISTA_PRODUTOS_2
    FOREIGN KEY (id_venda)
    REFERENCES VENDA (id_venda)
    ON DELETE RESTRICT;