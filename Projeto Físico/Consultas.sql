-- GROUP BY / HAVING
-- Mostra cpf do instrutor com o número de alunos avaliados em um dia que seja maior ou igual a 2
SELECT T.CPF_INSTRUTOR, COUNT(T.CPF_ALUNO), AF.DATA
FROM TEM T JOIN AVALIACAO_FISICA AF ON T.CPF_INSTRUTOR = AF.CPF_INSTRUTOR
GROUP BY T.CPF_INSTRUTOR, AF.DATA
HAVING COUNT(T.CPF_ALUNO) >= 2;

-- JUNÇÃO INTERNA
-- Mostra o nome dos alunos que contrataram o plano mensal
SELECT U.NOME
FROM USUARIO_DA_ACADEMIA U INNER JOIN ALUNO A ON (U.CPF = A.CPF) INNER JOIN CONTRATOU C ON (A.CPF = C.CPF_ALUNO)
WHERE A.ID_PLANO = 1;

-- JUNÇÃO EXTERNA
-- Mostra o nome do aluno e do personal de cada aluno
SELECT UA.Nome AS Aluno, PT.Nome AS Personal_Trainer
FROM Aluno A
LEFT JOIN Usuario_da_Academia UA ON A.CPF = UA.CPF
LEFT JOIN Personal_Trainer PT ON A.CREF_PT = PT.CREF;

-- SEMI-JUNÇÃO
-- Mostra o nome e cpf dos alunos que tem personal trainer
Select A.CPF, UA.NOME
FROM Aluno A, Usuario_da_academia UA
WHERE A.CPF = UA.CPF
AND EXISTS(
    SELECT *
    FROM Personal_Trainer PT
    Where A.CREF_PT = PT.CREF 
);

-- ANTI-JUNÇÃO
-- Mostra uma tabela com o nome e cpf dos alunos sem Personal Trainer
SELECT UA.Nome, UA.CPF
FROM Usuario_da_Academia UA
JOIN Aluno A ON UA.CPF = A.CPF
WHERE NOT EXISTS (
    SELECT P.CREF
    FROM PERSONAL_TRAINER P
    WHERE A.CREF_PT = P.CREF
);

-- SUBCONSULTA ESCALAR
-- Mostra o salário do RH
Select Salario
From Funcionario
Where CPF_Func = ANY (
    Select A.CPF
    From Administracao A
    Where FUNCAO = 'RH'
);

-- SUBCONSULTA DE LINHA
-- Mostra todas as informações de usuario da academia do aluno mais velho da academia
SELECT *
FROM Usuario_da_academia
WHERE Nascimento = (
    SELECT MIN(Nascimento)
    FROM Usuario_da_academia UA, Aluno A
    where UA.cpf = A.cpf
);

-- SUBCONSULTA DE TABELA
-- Mostra todos os alunos que realizaram avaliação física no mês de março e a data
SELECT U.NOME, AF.DATA
FROM USUARIO_DA_ACADEMIA U INNER JOIN ALUNO A ON (U.CPF = A.CPF)
INNER JOIN (SELECT CPF_ALUNO, DATA 
    		FROM AVALIACAO_FISICA 
    		WHERE EXTRACT(MONTH FROM DATA) = 3
) AF ON A.CPF = AF.CPF_ALUNO;

-- OPERAÇÃO DE CONJUNTO
-- Mostra funcionários que também são alunos
SELECT CPF 
FROM Aluno
INTERSECT
SELECT CPF_func FROM Funcionario;

-- Procedimento (e sua chamada):
-- Atualizar Salário
CREATE OR REPLACE PROCEDURE Atualiza_Salario (
    p_CPF_func VARCHAR2,
    p_Novo_Salario INT
)
AS
BEGIN
    UPDATE Funcionario
    SET Salario = p_Novo_Salario
    WHERE CPF_func = p_CPF_func;
END;

CALL Atualiza_Salario('77788899900', 5000);

--Mostrar o numero de alunos por personal trainer
CREATE OR REPLACE PROCEDURE Get_Alunos_Por_PT AS
BEGIN
    FOR reg IN (
        SELECT PT.NOME AS PERSONAL_TRAINER, COUNT(A.CPF) AS NUM_ALUNOS
        FROM PERSONAL_TRAINER PT
        LEFT JOIN ALUNO A ON (PT.CREF = A.CREF_PT)
        GROUP BY PT.NOME
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Personal Trainer: ' || reg.PERSONAL_TRAINER || ' | Número de Alunos: ' || reg.NUM_ALUNOS);
    END LOOP;
END;
    
CALL Get_Alunos_Por_PT;

-- Procedimento que recebe o CPF de um aluno e retorna o nome do plano, o valor e o desconto aplicado no contrato mais recente.
CREATE OR REPLACE PROCEDURE GetPlanoAluno (
    p_CPF_Aluno IN VARCHAR2,
    p_Nome_Plano OUT VARCHAR2,
    p_Valor OUT FLOAT,
    p_Desconto OUT NUMBER
) AS
BEGIN
    SELECT P.Nome, P.Valor, C.Desconto
    INTO p_Nome_Plano, p_Valor, p_Desconto
    FROM Plano P
    JOIN Contratou C ON P.ID = C.ID_Plano
    WHERE C.CPF_Aluno = p_CPF_Aluno
      AND C.Data = (SELECT MAX(Data) FROM Contratou WHERE CPF_Aluno = p_CPF_Aluno);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_Nome_Plano := NULL;
        p_Valor := NULL;
        p_Desconto := NULL;
    WHEN OTHERS THEN
        p_Nome_Plano := 'Erro';
        p_Valor := -1;
        p_Desconto := -1;
END GetPlanoAluno;



-- Trigger
-- Impede do Aluno que possui um plano ativo de contratar outro
CREATE OR REPLACE TRIGGER verificar_plano_aluno
BEFORE INSERT ON Contratou
FOR EACH ROW
DECLARE
    qtd_planos INT;
BEGIN
    -- Conta quantos planos o aluno já possui
    SELECT COUNT(*) INTO qtd_planos 
    FROM Contratou 
    WHERE CPF_ALUNO = :NEW.CPF_ALUNO;
    
    -- Se já existir um plano, lança erro
    IF qtd_planos > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Erro: O aluno já possui um plano ativo');
    END IF;
END;
