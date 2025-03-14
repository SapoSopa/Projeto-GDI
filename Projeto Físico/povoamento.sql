-- Plano(ID Plano, Nome_Plano, Valor)
INSERT INTO PLANO VALUES (1, 'MENSAL', 120.00);
INSERT INTO PLANO VALUES (2, 'TRIMESTRAL', 350.00);
INSERT INTO PLANO VALUES (3, 'SEMESTRAL', 600.00);
INSERT INTO PLANO VALUES (4, 'ANUAL', 1100.00);

-- Personal Trainer(CREF, Nome) 
INSERT INTO PERSONAL_TRAINER VALUES ('123456-G/SP', 'Carlos Almeida');
INSERT INTO PERSONAL_TRAINER VALUES ('654321-M/RJ', 'Mariana Souza');
INSERT INTO PERSONAL_TRAINER VALUES ('987654-P/MG', 'Fernando Oliveira');

-- Equipamento (COD)
BEGIN
    FOR i IN 1..15 LOOP
        INSERT INTO EQUIPAMENTO VALUES (DEFAULT);
    END LOOP;
    COMMIT;
END;

-- Exercicios (ID)
BEGIN
    FOR i IN 1..5 LOOP
        INSERT INTO EXERCICIO VALUES (DEFAULT);
    END LOOP;
    COMMIT;
END;

-- Usuario_da_Academia (CPF, Nome, Endereço_Bairro, Endereço_Rua, Endereço_NCasa, Nascimento)
INSERT INTO USUARIO_DA_ACADEMIA (CPF, Nome, Bairro, Rua, NCasa, Nascimento) VALUES ('12345678900', 'Ana Pereira', 'Centro', 'Rua A', '101', TO_DATE('12-03-1995', 'DD-MM-YYYY'));
INSERT INTO USUARIO_DA_ACADEMIA (CPF, Nome, Bairro, Rua, NCasa, Nascimento) VALUES ('98765432111', 'Bruno Santos', 'Boa Viagem', 'Rua B', '202', TO_DATE('1998-07-25', 'DD-MM-YYYY'));
INSERT INTO USUARIO_DA_ACADEMIA (CPF, Nome, Bairro, Rua, NCasa, Nascimento) VALUES ('45612378922', 'Camila Rocha', 'Recife Antigo', 'Rua C', '303', TO_DATE('1992-11-10', 'DD-MM-YYYY'));
INSERT INTO USUARIO_DA_ACADEMIA (CPF, Nome, Bairro, Rua, NCasa, Nascimento) VALUES ('78945612333', 'Daniel Lima', 'Pina', 'Rua D', '404', TO_DATE('2000-05-30', 'DD-MM-YYYY'));
INSERT INTO USUARIO_DA_ACADEMIA (CPF, Nome, Bairro, Rua, NCasa, Nascimento) VALUES ('32165498744', 'Eduardo Silva', 'Casa Forte', 'Rua E', '505', TO_DATE('1993-09-15', 'DD-MM-YYYY'));
INSERT INTO USUARIO_DA_ACADEMIA (CPF, Nome, Bairro, Rua, NCasa, Nascimento) VALUES ('74185296355', 'Fernanda Costa', 'Boa Vista', 'Rua F', '606', TO_DATE('1996-01-20', 'DD-MM-YYYY'));
INSERT INTO USUARIO_DA_ACADEMIA (CPF, Nome, Bairro, Rua, NCasa, Nascimento) VALUES ('15935785266', 'Gabriela Martins', 'Tamarineira', 'Rua G', '707', TO_DATE('1999-04-05', 'DD-MM-YYYY'));
INSERT INTO USUARIO_DA_ACADEMIA (CPF, Nome, Bairro, Rua, NCasa, Nascimento) VALUES ('85274196377', 'Henrique Santos', 'Graças', 'Rua H', '808', TO_DATE('1994-06-18', 'DD-MM-YYYY'));

-- Contato (CPF, Contato)
INSERT INTO CONTATO (CPF, Contato) VALUES ('12345678900', '81999998888');
INSERT INTO CONTATO (CPF, Contato) VALUES ('12345678900', '81333334444');
INSERT INTO CONTATO (CPF, Contato) VALUES ('98765432111', '81988887777');
INSERT INTO CONTATO (CPF, Contato) VALUES ('45612378922', '81977776666');
INSERT INTO CONTATO (CPF, Contato) VALUES ('78945612333', '81966665555');
INSERT INTO CONTATO (CPF, Contato) VALUES ('32165498744', '81955554444');
INSERT INTO CONTATO (CPF, Contato) VALUES ('74185296355', '81944443333');
INSERT INTO CONTATO (CPF, Contato) VALUES ('15935785266', '81933332222');
INSERT INTO CONTATO (CPF, Contato) VALUES ('85274196377', '81922221111');

-- Aluno (CPF, ID_Plano, CREF_PT)
INSERT INTO ALUNO (CPF, ID_Plano, CREF_PT) VALUES ('12345678900', 1, '123456-G/SP');
INSERT INTO ALUNO (CPF, ID_Plano, CREF_PT) VALUES ('98765432111', 2, NULL);
INSERT INTO ALUNO (CPF, ID_Plano, CREF_PT) VALUES ('45612378922', 3, '654321-M/RJ');
INSERT INTO ALUNO (CPF, ID_Plano, CREF_PT) VALUES ('78945612333', 1, NULL);
INSERT INTO ALUNO (CPF, ID_Plano, CREF_PT) VALUES ('32165498744', 2, '987654-P/MG');
INSERT INTO ALUNO (CPF, ID_Plano, CREF_PT) VALUES ('74185296355', 3, '123456-G/SP'); 
INSERT INTO ALUNO (CPF, ID_Plano, CREF_PT) VALUES ('15935785266', 1, NULL);
INSERT INTO ALUNO (CPF, ID_Plano, CREF_PT) VALUES ('85274196377', 2, '654321-M/RJ');

-- Funcionário(CPF_Func, Salário, CPF_CHEFE)
-- Chefe (CPF_CHEFE IS NULL)
INSERT INTO FUNCIONARIO VALUES ('11122233344', 9000, NULL);

-- Funcionários que possuem o chefe acima
INSERT INTO FUNCIONARIO VALUES ('55566677788', 4000.00, '11122233344');
INSERT INTO FUNCIONARIO VALUES ('99988877766', 4500.00, '11122233344');
INSERT INTO FUNCIONARIO VALUES ('22233344455', 4200.00, '11122233344');
INSERT INTO FUNCIONARIO VALUES ('77788899900', 4100.00, '11122233344');
INSERT INTO FUNCIONARIO VALUES ('22223333444', 2000.00, '11122233344');
INSERT INTO FUNCIONARIO VALUES ('33334444555', 2200.00, '11122233344');
INSERT INTO FUNCIONARIO VALUES ('44445555666', 2100.00, '11122233344');
INSERT INTO FUNCIONARIO VALUES ('55556666777', 6000.00, '11122233344');
INSERT INTO FUNCIONARIO VALUES ('66667777888', 6500.00, '11122233344');

-- Avaliação Física (Data, CPF_Aluno, CPF_Func)
INSERT INTO AVALIACAO_FISICA (Data, CPF_Aluno, CPF_Func) VALUES ('01-03-2024', '12345678900', '55566677788');
INSERT INTO AVALIACAO_FISICA (Data, CPF_Aluno, CPF_Func) VALUES ('05-03-2024', '98765432111', '99988877766');
INSERT INTO AVALIACAO_FISICA (Data, CPF_Aluno, CPF_Func) VALUES ('10-03-2024', '45612378922', '22233344455');
INSERT INTO AVALIACAO_FISICA (Data, CPF_Aluno, CPF_Func) VALUES ('15-03-2024', '78945612333', '77788899900');
INSERT INTO AVALIACAO_FISICA (Data, CPF_Aluno, CPF_Func) VALUES ('20-03-2024', '32165498744', '55566677788');

-- Instrutor (CPF)
INSERT INTO INSTRUTOR VALUES ('55566677788');
INSERT INTO INSTRUTOR VALUES ('99988877766');
INSERT INTO INSTRUTOR VALUES ('22233344455');
INSERT INTO INSTRUTOR VALUES ('77788899900');

--Administração (CPF, FUNCAO)
INSERT INTO Administracao (CPF, Funcao) VALUES ('11122233344', 'Dono')
ON DUPLICATE KEY UPDATE Funcao = 'Dono';

INSERT INTO Administracao (CPF, Funcao) VALUES ('22223333444', 'Faxineiro') 
ON DUPLICATE KEY UPDATE Funcao = 'Faxineiro';

INSERT INTO Administracao (CPF, Funcao) VALUES ('33334444555', 'Faxineiro') 
ON DUPLICATE KEY UPDATE Funcao = 'Faxineiro';

INSERT INTO Administracao (CPF, Funcao) VALUES ('44445555666', 'Recepcionista') 
ON DUPLICATE KEY UPDATE Funcao = 'Recepcionista';

INSERT INTO Administracao (CPF, Funcao) VALUES ('55556666777', 'Recepcionista') 
ON DUPLICATE KEY UPDATE Funcao = 'Recepcionista';

INSERT INTO Administracao (CPF, Funcao) VALUES ('66667777888', 'RH') 
ON DUPLICATE KEY UPDATE Funcao = 'RH';

-- TEM (CPF_Aluno, CPF_Func)
INSERT INTO TEM (CPF_Aluno, CPF_Func) VALUES ('12345678900', '55566677788');
INSERT INTO TEM (CPF_Aluno, CPF_Func) VALUES ('98765432111', '99988877766');
INSERT INTO TEM (CPF_Aluno, CPF_Func) VALUES ('45612378922', '22233344455');
INSERT INTO TEM (CPF_Aluno, CPF_Func) VALUES ('78945612333', '77788899900');
INSERT INTO TEM (CPF_Aluno, CPF_Func) VALUES ('32165498744', '55566677788');
INSERT INTO TEM (CPF_Aluno, CPF_Func) VALUES ('74185296355', '99988877766');

-- Ficha de Treino 
INSERT INTO Ficha_de_Treino  (CPF_Aluno, CPF_Func) VALUES ('12345678910', '10987654321');
INSERT INTO Ficha_de_Treino (CPF_Aluno, CPF_Func) VALUES ('98765432100', '10293847566');
INSERT INTO Ficha_de_Treino (CPF_Aluno, CPF_Func) VALUES ('56473829100', '90817263544');
INSERT INTO Ficha_de_Treino (CPF_Aluno, CPF_Func) VALUES ('19283746500', '81726354433');
INSERT INTO Ficha_de_Treino (CPF_Aluno, CPF_Func) VALUES ('11223344556', '22334455667');
INSERT INTO Ficha_de_Treino (CPF_Aluno, CPF_Func) VALUES ('33445566778', '55667788990');

-- Acompanhante(CPF, Nome)
INSERT INTO ACOMPANHANTE VALUES ('12345678900', 'Ana Pereira');
INSERT INTO ACOMPANHANTE VALUES ('98765432111', 'Bruno Santos');
INSERT INTO ACOMPANHANTE VALUES ('45612378922', 'Camila Rocha');

-- ContatoAc(CPF, ContatoAc)
INSERT INTO CONTATOAC (CPF, Contato) VALUES ('12345678900', '81998190000');
INSERT INTO CONTATOAC (CPF, Contato) VALUES ('98765432111', '81997732138');
INSERT INTO CONTATOAC (CPF, Contato) VALUES ('45612378922', '81988714153');

-- Contratou(CPF_Aluno, ID_Plano, Data, Desconto)
INSERT INTO CONTRATOU VALUES ('12345678900', '03-01-2025', 10.00);
INSERT INTO CONTRATOU VALUES ('98765432111', '03-02-2025', 15.00);
INSERT INTO CONTRATOU VALUES ('45612378922', '03-03-2025', 20.00);
INSERT INTO CONTRATOU VALUES ('78945612333', '03-04-2025', 5.00);
INSERT INTO CONTRATOU VALUES ('32165498744', '03-05-2025', 12.00);
INSERT INTO CONTRATOU VALUES ('74185296355', '03-06-2025', 18.00);
INSERT INTO CONTRATOU VALUES ('15935785266', '03-07-2025', 8.00);
INSERT INTO CONTRATOU VALUES ('85274196377', '03-08-2025', 10.00);


-- FT_POSSUI_Ex(Cod, ID)
BEGIN
    FOR i IN 1..5 LOOP
        INSERT INTO FT_POSSUI_EX VALUES (DEFAULT);
    END LOOP;
    COMMIT;
END;

-- Realiza(CPF_Aluno, COD_Equipamento, ID, Data)
INSERT INTO REALIZA VALUES ('12345678900', '01-03-2025');
INSERT INTO REALIZA VALUES ('12345678900', '02-03-2025');
INSERT INTO REALIZA VALUES ('12345678900', '03-03-2025');
INSERT INTO REALIZA VALUES ('12345678900', '04-03-2025');
INSERT INTO REALIZA VALUES ('12345678900', '05-03-2025');
INSERT INTO REALIZA VALUES ('12345678900', '06-03-2025');
INSERT INTO REALIZA VALUES ('12345678900', '07-03-2025');
INSERT INTO REALIZA VALUES ('12345678900', '08-03-2025');
INSERT INTO REALIZA VALUES ('12345678900', '10-03-2025');

INSERT INTO REALIZA VALUES ('98765432111', '01-03-2025');
INSERT INTO REALIZA VALUES ('98765432111', '02-03-2025');
INSERT INTO REALIZA VALUES ('98765432111', '03-03-2025');
INSERT INTO REALIZA VALUES ('98765432111', '04-03-2025');
INSERT INTO REALIZA VALUES ('98765432111', '05-03-2025');
INSERT INTO REALIZA VALUES ('98765432111', '06-03-2025');
INSERT INTO REALIZA VALUES ('98765432111', '07-03-2025');
INSERT INTO REALIZA VALUES ('98765432111', '10-03-2025');

INSERT INTO REALIZA VALUES ('45612378922', '01-03-2025');
INSERT INTO REALIZA VALUES ('45612378922', '02-03-2025');
INSERT INTO REALIZA VALUES ('45612378922', '03-03-2025');
INSERT INTO REALIZA VALUES ('45612378922', '04-03-2025');
INSERT INTO REALIZA VALUES ('45612378922', '05-03-2025');
INSERT INTO REALIZA VALUES ('45612378922', '06-03-2025');
INSERT INTO REALIZA VALUES ('45612378922', '07-03-2025');
INSERT INTO REALIZA VALUES ('45612378922', '08-03-2025');
INSERT INTO REALIZA VALUES ('45612378922', '09-03-2025');
INSERT INTO REALIZA VALUES ('45612378922', '10-03-2025');

INSERT INTO REALIZA VALUES ('78945612333', '01-03-2025');
INSERT INTO REALIZA VALUES ('78945612333', '02-03-2025');
INSERT INTO REALIZA VALUES ('78945612333', '03-03-2025');
INSERT INTO REALIZA VALUES ('78945612333', '04-03-2025');
INSERT INTO REALIZA VALUES ('78945612333', '05-03-2025');
INSERT INTO REALIZA VALUES ('78945612333', '06-03-2025');
INSERT INTO REALIZA VALUES ('78945612333', '09-03-2025');
INSERT INTO REALIZA VALUES ('78945612333', '10-03-2025');

INSERT INTO REALIZA VALUES ('32165498744', '01-03-2025');
INSERT INTO REALIZA VALUES ('32165498744', '02-03-2025');
INSERT INTO REALIZA VALUES ('32165498744', '03-03-2025');
INSERT INTO REALIZA VALUES ('32165498744', '09-03-2025');
INSERT INTO REALIZA VALUES ('32165498744', '10-03-2025');

INSERT INTO REALIZA VALUES ('74185296355', '01-03-2025');
INSERT INTO REALIZA VALUES ('74185296355', '02-03-2025');
INSERT INTO REALIZA VALUES ('74185296355', '03-03-2025');
INSERT INTO REALIZA VALUES ('74185296355', '04-03-2025');
INSERT INTO REALIZA VALUES ('74185296355', '09-03-2025');
INSERT INTO REALIZA VALUES ('74185296355', '10-03-2025');

INSERT INTO REALIZA VALUES ('15935785266', '01-03-2025');
INSERT INTO REALIZA VALUES ('15935785266', '02-03-2025');
INSERT INTO REALIZA VALUES ('15935785266', '03-03-2025');
INSERT INTO REALIZA VALUES ('15935785266', '04-03-2025');
INSERT INTO REALIZA VALUES ('15935785266', '08-03-2025');
INSERT INTO REALIZA VALUES ('15935785266', '09-03-2025');
INSERT INTO REALIZA VALUES ('15935785266', '10-03-2025');

INSERT INTO REALIZA VALUES ('85274196377', '01-03-2025');
INSERT INTO REALIZA VALUES ('85274196377', '02-03-2025');
INSERT INTO REALIZA VALUES ('85274196377', '06-03-2025');
INSERT INTO REALIZA VALUES ('85274196377', '07-03-2025');
INSERT INTO REALIZA VALUES ('85274196377', '08-03-2025');
INSERT INTO REALIZA VALUES ('85274196377', '09-03-2025');
INSERT INTO REALIZA VALUES ('85274196377', '10-03-2025');
