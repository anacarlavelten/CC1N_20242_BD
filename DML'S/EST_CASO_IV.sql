CREATE SCHEMA EST_CASO_IV;
USE EST_CASO_IV;

CREATE TABLE IF NOT EXISTS ALUNOS(
ALUNO_MATRICULA INT PRIMARY KEY,
ALUNO_CPF VARCHAR(20),
ALUNO_NOME VARCHAR(100),
ALUNO_DATANASC DATE ,
ALUNO_RUA VARCHAR(45),
ALUNO_NUMRUA INT,
ALUNO_BAIRRO VARCHAR(45),
ALUNO_CIDADE VARCHAR(45),
ALUNO_ESTADO VARCHAR(45),
ALUNO_PAIS VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS MODALIDADES(
MOD_ID INT PRIMARY KEY,
MOD_NOME VARCHAR (50),
MOD_DESC VARCHAR (200)
);

CREATE TABLE IF NOT EXISTS INSTRUTORES(
INST_CPF INT PRIMARY KEY,
INST_NOME VARCHAR (100),
INST_DATANASC DATE,
INST_MOD INT,
CONSTRAINT INST_FK_MOD FOREIGN KEY (INST_MOD) REFERENCES MODALIDADES (MOD_ID)
);


CREATE TABLE IF NOT EXISTS TREINAMENTOS(
TRAL_ID INT PRIMARY KEY,
TRIS_ID INT,
TR_DESCRIÇÃO VARCHAR(200),
CONSTRAINT ALUNO_FK FOREIGN KEY (TRAL_ID) REFERENCES ALUNOS (ALUNO_MATRICULA),
CONSTRAINT INST_FK FOREIGN KEY (TRIS_ID) REFERENCES INSTRUTORES (INST_CPF)
);

CREATE TABLE IF NOT EXISTS HORARIOS(
HORARIO_ID INT PRIMARY KEY,
HORARIO_DIA DATE,
HORARIO_HORA TIME
);

CREATE TABLE IF NOT EXISTS AULAS(
AULA_ID INT PRIMARY KEY,
AULA_IST INT,
AULA_ALUNO INT,
AULA_HORARIO INT,
AULA_CAPACIDADE DECIMAL (10,0),
CONSTRAINT INST_FK_AULA FOREIGN KEY (AULA_IST) REFERENCES INSTRUTORES(INST_CPF),
CONSTRAINT ALUN_FK_AULA FOREIGN KEY (AULA_ALUNO) REFERENCES ALUNOS(ALUNO_MATRICULA),
CONSTRAINT HORA_FK_AULA FOREIGN KEY (AULA_HORARIO) REFERENCES HORARIOS(HORARIO_ID)
);

CREATE TABLE IF NOT EXISTS PAGAMENTOS(
PAG_ID INT PRIMARY KEY,
PAG_ALUNO INT,
PAG_DIA DATETIME,
PAG_VALOR DECIMAL (10,2),
PAG_STATUS SET ("PAGO","PENDENTE"),
CONSTRAINT PAG_FK_ALUN FOREIGN KEY (PAG_ALUNO) REFERENCES ALUNOS(ALUNO_MATRICULA)
);

-----------------------------------------------------------------------------------------------------------------------------------

INSERT INTO ALUNOS (ALUNO_MATRICULA, ALUNO_CPF, ALUNO_NOME, ALUNO_DATANASC, ALUNO_RUA, ALUNO_NUMRUA, ALUNO_BAIRRO, ALUNO_CIDADE, ALUNO_ESTADO, ALUNO_PAIS)
VALUES 
(1822, '123.456.789-00', 'João Silva', '2000-05-15', 'Rua A', 123, 'Centro', 'São Paulo', 'SP', 'Brasil'),
(2285, '987.628.321-00', 'Maria Oliveira', '1998-07-22', 'Rua B', 456, 'Jardim Paulista', 'Rio de Janeiro', 'RJ', 'Brasil'),
(2454, '555.666.652-88', 'Carlos Souza', '2002-10-11', 'Rua C', 789, 'Vila Mariana', 'Belo Horizonte', 'MG', 'Brasil'),
(4245, '638.485.521-44', 'Ana Costa', '1999-12-30', 'Rua D', 101, 'Boa Vista', 'Porto Alegre', 'RS', 'Brasil'),
(2525, '242.245.666-77', 'Lucas Pereira', '2001-03-14', 'Rua E', 202, 'Tijuca', 'Curitiba', 'PR', 'Brasil');

UPDATE ALUNOS
SET ALUNO_MATRICULA = 4525
WHERE ALUNO_MATRICULA = 4245;

UPDATE ALUNOS
SET ALUNO_MATRICULA = 1188
WHERE ALUNO_MATRICULA = 2525;

DELETE FROM ALUNOS
WHERE ALUNO_MATRICULA = 2454;

-----------------------------------------------------------------------------------------------------------------------------------

INSERT INTO MODALIDADES (MOD_ID, MOD_NOME, MOD_DESC)
VALUES 
(10, 'Yoga', 'Prática física e mental para melhorar o bem-estar e flexibilidade.'),
(20, 'Pilates', 'Exercícios focados em fortalecer o core e melhorar a postura.'),
(30, 'Musculação', 'Treinamento com pesos para aumentar a força muscular.'),
(40, 'Zumba', 'Aula de dança aeróbica com ritmos latinos para diversão e emagrecimento.'),
(50, 'Boxe', 'Treinamento de combate e condicionamento físico através de socos e movimentos rápidos.');

UPDATE MODALIDADES
SET MOD_ID = 55
WHERE ALUNO_MATRICULA = 50;

UPDATE MODALIDADES
SET MOD_ID = 66
WHERE ALUNO_MATRICULA = 40;

DELETE FROM MODALIDADES
WHERE MOD_ID = 10;

-----------------------------------------------------------------------------------------------------------------------------------

INSERT INTO INSTRUTORES (INST_CPF, INST_NOME, INST_DATANASC, INST_MOD)
VALUES 
(19840603755, 'Renato Lima', '1985-03-12', 10),
(24440603735, 'Paula Santos', '1990-11-21', 20),
(47440603745, 'Roberto Alves', '1982-07-25', 30),
(19447503755, 'Fernanda Rocha', '1995-04-17', 40),
(19440603744, 'Carlos Martins', '1988-08-30', 50);

UPDATE INSTRUTORES
SET INST_CPF = 24440603749
WHERE INST_CPF = 24440603749;

UPDATE INSTRUTORES
SET INST_DATANASC = '1990-12-21'
WHERE INST_DATANASC = '1990-11-21';

DELETE FROM INSTRUTORES
WHERE INST_CPF = 19447503755;

-----------------------------------------------------------------------------------------------------------------------------------

INSERT INTO TREINAMENTOS (TRAL_ID, TRIS_ID, TR_DESCRIÇÃO)
VALUES 
(2525, 19840603755, 'Treinamento para iniciantes em Yoga focando em flexibilidade e relaxamento.'),
(4245, 24440603735, 'Pilates para melhorar a postura e fortalecer o core.'),
(2454, 47440603745, 'Musculação para ganho de força e resistência muscular.'),
(2285, 19447503755, 'Aula de Zumba para emagrecimento e diversão com ritmo intenso.'),
(1822, 19440603744, 'Treinamento de boxe para condicionamento físico e técnica de combate.');

UPDATE TREINAMENTOS
SET TR_DESCRIÇÃO = 'Aula de Zumba para emagrecimento e diversão com ritmo leve.'
WHERE TR_DESCRIÇÃO = 'Aula de Zumba para emagrecimento e diversão com ritmo intenso.';

UPDATE TREINAMENTOS
SET TR_DESCRIÇÃO = 'Treinamento de luta para condicionamento físico e técnica de combate.'
WHERE TR_DESCRIÇÃO = 'Treinamento de boxe para condicionamento físico e técnica de combate.';

DELETE FROM TREINAMENTOS 
WHERE TR_DESCRIÇÃO = 'Pilates para melhorar a postura e fortalecer o core.';

-----------------------------------------------------------------------------------------------------------------------------------

INSERT INTO HORARIOS (HORARIO_ID, HORARIO_DIA, HORARIO_HORA)
VALUES 
(17, '2024-11-17', '08:00:00'),
(24, '2024-11-17', '10:00:00'),
(37, '2024-11-17', '14:00:00'),
(44, '2024-11-18', '09:00:00'),
(57, '2024-11-18', '18:00:00');

UPDATE HORARIOS
SET HORARIO_ID = 51
WHERE HORARIO_ID = 57;

UPDATE HORARIOS
SET HORARIO_ID = 43
WHERE HORARIO_ID = 44;

DELETE FROM HORARIOS
WHERE HORARIO_ID = 24;

-----------------------------------------------------------------------------------------------------------------------------------

INSERT INTO AULAS (AULA_ID, AULA_IST, AULA_ALUNO, AULA_HORARIO, AULA_CAPACIDADE)
VALUES 
(187, 19440603744, 2525, 57, 20),
(225, 19447503755, 4245, 44, 15),
(363, 47440603745, 2454, 37, 25),
(441, 24440603735, 2285, 24, 30),
(532, 19840603755, 2285, 17, 18);

UPDATE AULAS
SET AULA_CAPACIDADE = 26
WHERE AULA_CAPACIDADE = 25;

UPDATE AULAS
SET AULA_CAPACIDADE = 36
WHERE AULA_CAPACIDADE = 30;

DELETE FROM AULAS
WHERE AULA_CAPACIDADE = 18;

-----------------------------------------------------------------------------------------------------------------------------------

INSERT INTO PAGAMENTOS (PAG_ID, PAG_ALUNO, PAG_DIA, PAG_VALOR, PAG_STATUS)
VALUES 
(155, 2285, '2024-11-01 12:30:00', 150.00, 'PAGO'),
(255, 2454, '2024-11-02 09:15:00', 200.00, 'PENDENTE'),
(355, 4245, '2024-11-03 14:45:00', 250.00, 'PAGO'),
(455, 2525, '2024-11-04 11:00:00', 180.00, 'PENDENTE'),
(555, 2525, '2024-11-05 16:00:00', 220.00, 'PAGO');

UPDATE PAGAMENTOS
SET PAG_VALOR = 155.00
WHERE PAG_VALOR = 150.00;

UPDATE PAGAMENTOS
SET PAG_VALOR = 185.00
WHERE PAG_VALOR = 180.00;

DELETE FROM PAGAMENTOS
WHERE PAG_VALOR = 200.00;
