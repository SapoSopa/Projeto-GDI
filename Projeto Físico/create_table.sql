CREATE TABLE Plano (
    ID NUMBER(2,0) CONSTRAINT PK_Plano PRIMARY KEY,
    Nome VARCHAR2(50),
    Valor FLOAT
);

CREATE TABLE Personal_Trainer (
    CREF VARCHAR2(11) CONSTRAINT PK_PersonalTreiner PRIMARY KEY,
    Nome VARCHAR2(50) NOT NULL
);

CREATE TABLE Equipamento( 
	Cod INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL, 
	CONSTRAINT PK_Equipamento PRIMARY KEY (Cod) 
);

CREATE TABLE Exercicio( 
	ID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL, 
	CONSTRAINT PK_Exercicio PRIMARY KEY (ID) 
);

CREATE TABLE Usuario_da_Academia (
    CPF VARCHAR2(11) CONSTRAINT PK_UsuarioAcademia PRIMARY KEY,
    Nome VARCHAR2(50) not null,
    Bairro VARCHAR2(50) not null,
    Rua VARCHAR2(50) not null,
    NCasa VARCHAR2(5) not null,
    Nascimento DATE not null
);