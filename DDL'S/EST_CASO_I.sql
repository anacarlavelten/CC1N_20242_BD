CREATE SCHEMA EST_CASO_I;

USE EST_CASO_I;

CREATE TABLE IF NOT EXISTS FORNECEDORES(
FORN_COD INT PRIMARY KEY,
FORN_NOME VARCHAR(45) NOT NULL,
FORN_RUA VARCHAR(45) NOT NULL,
FORN_NUMRUA INT,
FORN_BAIRRO VARCHAR(45) NOT NULL,
FORN_CIDADE VARCHAR(45) NOT NULL,
FORN_ESTADO VARCHAR(45) NOT NULL,
FORN_PAIS VARCHAR(30) NOT NULL,
FORN_CODPOSTAL VARCHAR(10) NOT NULL,
FORN_TELEFONE VARCHAR(15) NOT NULL,
FORN_CONTATO TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS FILIAIS(
FIL_COD INT PRIMARY KEY,
FIL_NOME VARCHAR(45) NOT NULL,
FIL_RUA VARCHAR(100) NOT NULL,
FIL_NUMRUA INT,
FIL_BAIRRO VARCHAR(50) NOT NULL,
FIL_CIDADE VARCHAR(50) NOT NULL,
FIL_ESTADO VARCHAR(50) NOT NULL,
FIL_PAIS VARCHAR(50) NOT NULL,
FIL_CODPOSTAL VARCHAR(10) NOT NULL,
FIL_CAPACIDADE TEXT NOT NULL);


CREATE TABLE IF NOT EXISTS PRODUTOS(
PROD_COD INT PRIMARY KEY,
PROD_NOME VARCHAR(50) NOT NULL,
PROD_DESCRICAO TEXT NOT NULL,
PROD_ESPECTEC TEXT NOT NULL,
PROD_QUANT DECIMAL(10,3) NOT NULL,
PROD_PRECOUNIT DECIMAL(10,2) NOT NULL,
PROD_UNIDMEDIDA VARCHAR(10) NOT NULL,
PROD_ESTOQ_MIN DECIMAL(10,3) NOT NULL
);

CREATE TABLE IF NOT EXISTS PEDIDOS(
PED_CODIGO INT PRIMARY KEY,
PED_DATA DATE NOT NULL,
PED_HORA TIME NOT NULL,
PED_PREVISAO DATE NOT NULL,
PED_STATUS ENUM('PENDENTE','CONCLUÍDO','EM ESPERA'),
PED_FORNECEDOR INT NOT NULL,
CONSTRAINT FK_FORNECEDOR FOREIGN KEY (PED_FORNECEDOR)
REFERENCES FORNECEDORES(FORN_COD)
);

CREATE TABLE IF NOT EXISTS RECEBIMENTOS(
REC_DATA DATE NOT NULL,
REC_HORA TIME NOT NULL,
REC_QUANT_PROD DECIMAL(10,3),
REC_CONDICAO TEXT NOT NULL,
REC_PEDIDOS INT PRIMARY KEY,
CONSTRAINT FK_PEDIDOS FOREIGN KEY(RECEB_PEDIDOS) REFERENCES PEDIDOS(PED_CODIGO)
);


CREATE TABLE IF NOT EXISTS PEDIDOS_PRODUTOS(
PDPR_PEDIDOS INT,
PDPR_PRODUTOS INT,
PRIMARY KEY(PDPR_PEDIDOS,PDPR_PRODUTOS),
PDPR_QUANT DECIMAL(10,3) NOT NULL,
CONSTRAINT PDPR_FK_PEDIDOS FOREIGN KEY(PDPR_PEDIDOS) REFERENCES PEDIDOS(PED_CODIGO),
CONSTRAINT PDPR_FK_PRODUTOS FOREIGN KEY(PDPR_PRODUTOS) REFERENCES PRODUTOS(PROD_COD)
);


CREATE TABLE IF NOT EXISTS FILIAIS_PRODUTOS(
FLPR_FILIAL INT,
FLPR_PRODUTOS INT,
PRIMARY KEY(FLPR_FILIAL,FLPR_PRODUTOS),
FLPR_QUANT DECIMAL(10,3) NOT NULL,
CONSTRAINT FLPR_FK_FILIAIS FOREIGN KEY(FLPR_FILIAL) REFERENCES FILIAIS(FILIAL_COD),
CONSTRAINT FLPR_FK_PRODUTOS FOREIGN KEY(FLPR_PRODUTOS) REFERENCES PRODUTOS(PROD_COD)
);


CREATE TABLE IF NOT EXISTS FORNECEDORES_PRODUTOS(
FRPR_FORNECEDOR INT,
FRPR_PRODUTOS INT,
PRIMARY KEY(FRPR_FORNECEDOR,FRPR_PRODUTOS),
CONSTRAINT FRPR_FK_FORNECEDORES FOREIGN KEY(FRPR_FORNECEDOR)
REFERENCES FORNECEDORES(FORN_COD),
CONSTRAINT FRPR_FK_PRODUTOS FOREIGN KEY(FRPR_PRODUTOS) 
REFERENCES PRODUTOS(PROD_COD)
);

CREATE A TABLE IF NOT EXISTS ENDEREÇOS (
ADD_ID INT PRIMARY KEY,
ADD_RUA VARCHAR(45) NOT NULL,
ADD_NUMRUA INT,
ADD_BAIRRO VARCHAR(45) NOT NULL,
ADD_CIDADE VARCHAR(45) NOT NULL,
ADD_ESTADO VARCHAR(45) NOT NULL,
ADD_PAIS VARCHAR(30) NOT NULL,
ADD_CODPOSTAL VARCHAR(10) NOT NULL,
ADD_TELEFONE VARCHAR(15) NOT NULL,
ADD_CONTATO TEXT NOT NULL
);


-----------------------------
#DDLS

#FORNECEDORES

ALTER TABLE FORNECEDORES ADD EMAIL VARCHAR(60);

ALTER TABLE FORNECEDORES MODIFY COLUMN EMAIL VARCHAR(100);

ALTER TABLE FORNECEDORES CHANGE COLUMN EMAIL FORN_EMAIL VARCHAR(100);

ALTER TABLE FORNECEDORES DROP COLUMN FORN_EMAIL;

----------------------------------------------------------------------
#FILIAIS

ALTER TABLE FILIAIS ADD CONTATO DECIMAL(10,0);

ALTER TABLE FILIAIS MODIFY COLUMN CONTATO VARCHAR(100);

ALTER TABLE FILIAIS CHANGE COLUMN CONTATO FIL_CONTATO VARCHAR(100);

ALTER TABLE FILIAIS DROP COLUMN FIL_CONTATO;

----------------------------------------------------------------------
#PRODUTOS

ALTER TABLE PRODUTOS ADD COR VARCHAR(50);

ALTER TABLE PRODUTOS MODIFY COLUMN COR TEXT;

ALTER TABLE PRODUTOS CHANGE COLUMN COR PROD_COR TEXT;

ALTER TABLE PRODUTOS DROP COLUMN PROD_COR;

----------------------------------------------------------------------
#PEDIDOS

ALTER TABLE PEDIDOS ADD VALOR VARCHAR(10);

ALTER TABLE PEDIDOS MODIFY COLUMN VALOR DECIMAL(10,2);

ALTER TABLE PEDIDOS CHANGE COLUMN VALOR PED_VALOR DECIMAL(10,2);

ALTER TABLE PEDIDOS DROP COLUMN PED_VALOR;

------------------------------------------------------------------------
 #RECEBIMENTOS

ALTER TABLE RECEBIMENTOS ADD DESCRIÇAO TEXT;

ALTER TABLE RECEBIMENTOS MODIFY COLUMN DESCRIÇAO VARCHAR(100);

ALTER TABLE RECEBIMENTOS CHANGE COLUMN DESCRIÇAO REC_DESC TEXT;

ALTER TABLE RECEBIMENTOS DROP COLUMN REC_DESC;

------------------------------------------------------------------------
#PEDIDOS_PRODUTOS

ALTER TABLE PEDIDOS_PRODUTOS ADD OPERADOR TEXT;

ALTER TABLE PEDIDOS_PRODUTOS MODIFY COLUMN OPERADOR VARCHAR(100);

ALTER TABLE PEDIDOS_PRODUTOS CHANGE COLUMN OPERADOR PDPR_OPERADOR VARCHAR(100);

ALTER TABLE PEDIDOS_PRODUTOS DROP COLUMN PDPR_OPERADOR;

-----------------------------------------------------------------------
#FILIAIS_PRODUTOS

ALTER TABLE FILIAIS_PRODUTOS ADD CODIGO VARCHAR(50);

ALTER TABLE FILIAIS_PRODUTOS MODIFY COLUMN CODIGO INT;

ALTER TABLE FILIAIS_PRODUTOS CHANGE COLUMN CODIGO FLPR_CODIGO INT;

ALTER TABLE FILIAIS_PRODUTOS DROP COLUMN FLPR_CODIGO;

-----------------------------------------------------------------------
#FORNECEDORES_PRODUTOS

ALTER TABLE FORNECECDORES_PRODUTOS ADD QUANTIDADE VARCHAR(50);

ALTER TABLE FORNECECDORES_PRODUTOS MODIFY COLUMN QUANTIDADE DECIMAL (10,3);

ALTER TABLE FORNECECDORES_PRODUTOS CHANGE COLUMN QUANTIDADE FRPR_QUANTI DECIMAL(10,3);

ALTER TABLE FORNECECDORES_PRODUTOS DROP COLUMN FRPR_QUANTI;

-----------------------------------------------------------------------
#ENDEREÇOS

ALTER TABLE ENDEREÇOS ADD CEP INT;

ALTER TABLE ENDEREÇOS MODIFY COLUMN CEP VARCHAR(30);

ALTER TABLE ENDEREÇOS CHANGE COLUMN CEP ADD_CEP DECIMAL(10,3);

ALTER TABLE ENDEREÇOS DROP COLUMN ADD_CEP;
----------------------------------------------------------------------
#DROP

DROP TABLE ENDERÇOS;

-----------------------------

#DML'S

INSERT INTO FORNECEDORES(FORN_COD, FORN_NOME, FORN_RUA, FORN_NUMRUA, FORN_BAIRRO, FORN_CIDADE, FORN_ESTADO, FORN_PAIS, FORN_CODPOSTAL, FORN_TELEFONE, FORN_CONTATO)
VALUES (551415,


