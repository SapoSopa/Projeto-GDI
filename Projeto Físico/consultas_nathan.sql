-- Consulta normal - Anti-Join

-- Mostra o CPF dos alunos que não possuem personal trainer

SELECT A.CPF
FROM ALUNO A
WHERE NOT EXISTS (
    SELECT P.CREF
    FROM PERSONAL_TRAINER P
    WHERE A.CREF_PT = P.CREF
)

SELECT AF.CPF_Aluno, AF.CPF_Instrutor
FROM  AVALIACAO_FISICA AF 
WHERE (AF.CPF_Aluno, AF.CPF_Instrutor) in {
    SELECT CPF_Aluno, CPF_Instrutor
    FROM Ficha_de_Treino
}

-- Consulta PL-SQL - Trigger

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
/

