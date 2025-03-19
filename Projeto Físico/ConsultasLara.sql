-- GROUP BY: Saber quantos aluno cada personal tem
Select Nome, Cref, COUNT (*) AS Qtd_Alunos
From Personal_Trainer PT, Aluno A
Where PT.CREF = A.CREF_PT
GROUP BY Nome, Cref
Order by Cref


-- GROUP BY/HAVING: Saber quais personais tem mais de um aluno
Select Nome, Cref, COUNT (*) AS Qtd_Alunos
From Personal_Trainer PT, Aluno A
Where PT.CREF = A.CREF_PT
GROUP BY Nome, Cref
HAVING COUNT(*) > 1


-- INNER JOIN: Saber o aluno, seu plano e o valor do plano
Select UA.Nome, P.Nome, P.Valor
From Aluno A, Plano P, Usuario_da_Academia UA
Where A.id_plano = P.ID
And A.CPF = UA.CPF

-- JUNÇÃO EXTERNA: Saber alunos que não tem personal
Select A.CPF
FROM Aluno A FULL OUTER JOIN Personal_Trainer PT
ON A.CREF_PT = PT.CREF
WHERE PT.CREF IS NULL

-- SEMI JOIN: Saber os alunos que tem personal
Select A.CPF, UA.NOME
FROM Aluno A, Usuario_da_academia UA
WHERE A.CPF = UA.CPF
AND EXISTS(
    SELECT *
    FROM Personal_Trainer PT
    Where A.CREF_PT = PT.CREF 
);

-- ANTI JOIN: Saber os alunos que não tem personal
Select A.CPF, UA.NOME
FROM Aluno A, Usuario_da_academia UA
WHERE A.CPF = UA.CPF
AND NOT EXISTS(
    SELECT *
    FROM Personal_Trainer PT
    Where A.CREF_PT = PT.CREF 
);

-- Subconsulta escalar (retorna apenas um valor): saber o salário do RH
Select Salario
From Funcionario
Where CPF_Func = ANY (
    Select A.CPF
    From Administracao A
    Where FUNCAO = 'RH'
)

-- Subconsulta do tipo linha: mostra o CPF e o salário do RH
Select CPF_Func, Salario
From Funcionario
Where CPF_Func = ANY (
    Select A.CPF
    From Administracao A
    Where FUNCAO = 'RH'
)

-- Subconsulta do tipo tabela: mostra o cpf, salário e cpf do chefe dos funcionários que tem chefe
Select *
From Funcionario
Where CPF_Func = ANY (
    Select A.CPF
    From Administracao A
    Where CPF_Chefe is not null
)

-- Operação de conjuntos
Select CPF
From Aluno
Union
Select CPF_Func
From Funcionario