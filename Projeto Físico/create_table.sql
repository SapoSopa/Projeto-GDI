CREATE TABLE Plano (
    ID NUMBER(2,0) CONSTRAINT PK_Plano PRIMARY KEY,
    Nome VARCHAR2(50),
    Valor FLOAT
);

CREATE TABLE PersonalTrainer (
    CREF VARCHAR2(11) CONSTRAINT PK_PersonalTreiner PRIMARY KEY,
    Nome VARCHAR2(50) NOT NULL
);

CREATE TABLE Equipamento (
    codigo NUMBER(2) CONSTRAINT PK_Equipamento PRIMARY KEY
);

CREATE TABLE SEQUENCE SEQ_equipamento (
    START WITH 1
    INCREMENT BY 1
    NOCACHE;
);

CREATE OR REPLACE TRIGGER trg_equipamento
BEFORE INSERT ON Equipamento
FOR EACH ROW
BEGIN
    IF :NEW.codigo IS NULL THEN
        SELECT seq_equipamento.NEXTVAL INTO :NEW.codigo FROM dual;
    END IF;
END;

CREATE TABLE AvaliacaoFisica (
    ID NUMBER(3) CONSTRAINT PK_AvaicaoFisica PRIMARY KEY
);

CREATE TABLE Exercicio (
    ID NUMBER(3) CONSTRAINT Exercicio PRIMARY KEY
);

CREATE TABLE UsuarioAcademia (
    CPF NUMBER(11) CONSTRAINT PK_UsuarioAcademia PRIMARY KEY,
    Nome VARCHAR2(50) not null,
    Bairro VARCHAR2(50) not null,
    Ruas VARCHAR2(50) not null,
    NCasa NUMBER(5)
);