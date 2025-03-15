/*
Administração
Tem
*/


 -- Ficha de Treino 
INSERT INTO Ficha_de_Treino  (CPF_Aluno, CPF_Func) 
VALUES ('123456789-10', '109876543-21')

INSERT INTO Ficha_de_Treino (CPF_Aluno, CPF_Func) 
VALUES ('98765432100', '10293847566');

INSERT INTO Ficha_de_Treino (CPF_Aluno, CPF_Func) 
VALUES ('56473829100', '90817263544');

INSERT INTO Ficha_de_Treino (CPF_Aluno, CPF_Func) 
VALUES ('19283746500', '81726354433');

INSERT INTO Ficha_de_Treino (CPF_Aluno, CPF_Func) 
VALUES ('11223344556', '22334455667');

INSERT INTO Ficha_de_Treino (CPF_Aluno, CPF_Func) 
VALUES ('33445566778', '55667788990');

--Administração
INSERT INTO Administracao (CPF, Funcao)
VALUES ('11112222333', 'Auxiliar_ADM')
ON DUPLICATE KEY UPDATE Funcao = 'Auxiliar_ADM'

INSERT INTO Administracao (CPF, Funcao) 
VALUES ('22223333444', 'Gerente') 
ON DUPLICATE KEY UPDATE Funcao = 'Gerente';

INSERT INTO Administracao (CPF, Funcao) 
VALUES ('33334444555', 'Coordenador') 
ON DUPLICATE KEY UPDATE Funcao = 'Coordenador';

INSERT INTO Administracao (CPF, Funcao) 
VALUES ('44445555666', 'Recepcionista') 
ON DUPLICATE KEY UPDATE Funcao = 'Recepcionista';

INSERT INTO Administracao (CPF, Funcao) 
VALUES ('55556666777', 'Supervisor') 
ON DUPLICATE KEY UPDATE Funcao = 'Supervisor';

INSERT INTO Administracao (CPF, Funcao) 
VALUES ('66667777888', 'Diretor') 
ON DUPLICATE KEY UPDATE Funcao = 'Diretor';
