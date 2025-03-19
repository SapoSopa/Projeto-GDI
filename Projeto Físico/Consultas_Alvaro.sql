--Group by/Having
--Mostre o número de funcionários que cada chefe chefia
SELECT U.NOME, COUNT(F.CPF_FUNC) AS FUNCIONARIOS
FROM USUARIO_DA_ACADEMIA U INNER JOIN FUNCIONARIO F ON (F.CPF_CHEFE = U.CPF)
GROUP BY U.NOME
HAVING COUNT(F.CPF_FUNC) > 0;

--Junção interna
--Mostre o nome dos alunos que contrataram o plano mensal
SELECT U.NOME
FROM USUARIO_DA_ACADEMIA U INNER JOIN ALUNO A ON (U.CPF = A.CPF) INNER JOIN CONTRATOU C ON (A.CPF = C.CPF_ALUNO)
WHERE A.ID_PLANO = 1;

--Subconsulta do tipo tabela
--Mostre todos os alunos que realizaram avaliação física no mês de março e a data
SELECT U.NOME, AF.DATA
FROM USUARIO_DA_ACADEMIA U INNER JOIN ALUNO A ON (U.CPF = A.CPF)
INNER JOIN (SELECT CPF_ALUNO, DATA 
    		FROM AVALIACAO_FISICA 
    		WHERE EXTRACT(MONTH FROM DATA) = 3
) AF ON A.CPF = AF.CPF_ALUNO;

--Procedimento com SQL embutida e parâmetro
--Mostrar o numero de alunos por personal trainer
CREATE OR REPLACE PROCEDURE Get_Alunos_Por_PT AS
BEGIN
    FOR reg IN (
        SELECT PT.Nome AS Personal_Trainer, COUNT(A.CPF) AS Num_Alunos
        FROM Personal_Trainer PT
        LEFT JOIN Aluno A ON (PT.CREF = A.CREF_PT)
        GROUP BY PT.Nome
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Personal Trainer: ' || reg.Personal_Trainer || ' | Número de Alunos: ' || reg.Num_Alunos);
    END LOOP;
END;
/

CALL Get_Alunos_Por_PT;
