-- Consultas do Henrique César

-- GROUP BY / HAVING
SELECT p.nome, COUNT(a.cpf) AS qtd_alunos
FROM plano p
JOIN aluno a ON p.id = a.id_plano
GROUP BY p.nome
HAVING COUNT(a.cpf) >= 3;

-- JUNÇÃO INTERNA
SELECT UA.Nome AS Aluno, PT.Nome AS Personal_Trainer
FROM Aluno A
INNER JOIN Usuario_da_Academia UA ON A.CPF = UA.CPF
INNER JOIN Personal_Trainer PT ON A.CREF_PT = PT.CREF;

-- JUNÇÃO EXTERNA
SELECT UA.Nome AS Aluno, PT.Nome AS Personal_Trainer
FROM Aluno A
LEFT JOIN Usuario_da_Academia UA ON A.CPF = UA.CPF
LEFT JOIN Personal_Trainer PT ON A.CREF_PT = PT.CREF;

-- SEMI-JUNÇÃO
SELECT UA.Nome
FROM Usuario_da_Academia UA
WHERE EXISTS (
    SELECT *
    FROM Avaliacao_Fisica AF
    WHERE AF.CPF_Aluno = UA.CPF
);

-- ANTI-JUNÇÃO
SELECT UA.Nome
FROM Usuario_da_Academia UA
JOIN Aluno A ON UA.CPF = A.CPF
WHERE NOT EXISTS (
    SELECT *
    FROM Avaliacao_Fisica AF
    WHERE AF.CPF_Aluno = A.CPF
);

-- SUBCONSULTA ESCALAR
SELECT UA.Nome
FROM Funcionario F, Usuario_da_Academia UA
WHERE F.CPF_func = UA.CPF
  AND F.Salario >= (
    SELECT AVG(Salario)
    FROM Funcionario
    );

-- SUBCONSULTA DE LINHA
SELECT *
FROM Usuario_da_academia
WHERE Nascimento = (
    SELECT MIN(Nascimento)
    FROM Usuario_da_academia UA, Aluno A
    where UA.cpf = A.cpf
);

-- SUBCONSULTA DE TABELA
SELECT * 
FROM Aluno 
WHERE ID_Plano = (
    SELECT ID_Plano 
    FROM Aluno
    WHERE CPF = '12345678900'
);

-- OPERAÇÃO DE CONJUNTO
SELECT CPF 
FROM Aluno
INTERSECT
SELECT CPF_func FROM Funcionario;

-- Procedimento (e sua chamada):
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

BEGIN
    Atualiza_Salario('77788899900', 5000);
END;