-- BANCO DE DADOS II
-- Professor: Argemiro Pentian Junior
-- SGBD: MariaDB
-- Ferramenta: DBeaver

USE hospital;

-- =====================================================
-- EXERCÍCIO 1
-- =====================================================

START TRANSACTION;

SELECT status
INTO @status_leito
FROM leito
WHERE nroleito = 2;

IF(@status_leito = 'ocupado') THEN
    ROLLBACK;
ELSE
    INSERT INTO internacao (
        codinternacao,
        codp,
        nroleito,
        data_entrada,
        motivo,
        codm_responsavel
    )
    VALUES (
        100,
        5,
        2,
        CURDATE(),
        'Observação clínica',
        1
    );

    UPDATE leito
    SET status = 'ocupado'
    WHERE nroleito = 2;

    COMMIT;
END IF;

-- =====================================================
-- EXERCÍCIO 2
-- =====================================================

START TRANSACTION;

SELECT COUNT(*)
INTO @estoque_insuficiente
FROM item_prescricao ip
INNER JOIN estoque e
ON ip.codmed = e.codmed
WHERE ip.codprescricao = 1
AND e.quantidade < ip.quantidade;

IF(@estoque_insuficiente > 0) THEN
    ROLLBACK;
ELSE

    UPDATE estoque e
    INNER JOIN item_prescricao ip
    ON e.codmed = ip.codmed
    SET e.quantidade = e.quantidade - ip.quantidade
    WHERE ip.codprescricao = 1;

    COMMIT;

END IF;

-- =====================================================
-- EXERCÍCIO 3
-- =====================================================

START TRANSACTION;

INSERT INTO exame (
    codexame,
    codp,
    codtipo,
    data,
    hora
)
VALUES (
    100,
    1,
    1,
    CURDATE(),
    '10:00:00'
);

SAVEPOINT exame_inserido;

INSERT INTO resultado_exame (
    codexame,
    codtipo,
    valor_obtido,
    observacao
)
VALUES (
    100,
    1,
    -10,
    'Resultado inicial'
);

SELECT valor_obtido
INTO @valor_resultado
FROM resultado_exame
WHERE codexame = 100;

IF(@valor_resultado < 0) THEN

    ROLLBACK TO SAVEPOINT exame_inserido;

    INSERT INTO resultado_exame (
        codexame,
        codtipo,
        valor_obtido,
        observacao
    )
    VALUES (
        100,
        1,
        0,
        'Valor inválido'
    );

END IF;

COMMIT;

-- =====================================================
-- EXERCÍCIO 4
-- =====================================================

START TRANSACTION;

SELECT COUNT(*)
INTO @medico_existe
FROM medico
WHERE codm = 1;

IF(@medico_existe = 0) THEN

    ROLLBACK;

ELSE

    INSERT INTO cirurgia (
        codcirurgia,
        codinternacao,
        codm_cirurgiao,
        data,
        hora,
        tipo_cirurgia,
        sala
    )
    VALUES (
        10,
        1,
        1,
        CURDATE(),
        '09:00:00',
        'Cirurgia cardíaca',
        'Sala 1'
    );

    INSERT INTO participa_cirurgia (
        codcirurgia,
        codm,
        funcao
    )
    VALUES (
        10,
        1,
        'Principal'
    );

    COMMIT;

END IF;

-- =====================================================
-- EXERCÍCIO 5
-- =====================================================

DELIMITER $$

CREATE PROCEDURE InserirPrescricao()
BEGIN

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro na prescrição';
    END;

    START TRANSACTION;

    INSERT INTO prescricao (
        codprescricao,
        codp,
        codm,
        data
    )
    VALUES (
        20,
        1,
        1,
        CURDATE()
    );

    INSERT INTO item_prescricao (
        codprescricao,
        codmed,
        quantidade
    )
    VALUES (
        20,
        1,
        2
    );

    COMMIT;

END $$

DELIMITER ;

-- =====================================================
-- EXERCÍCIO 6
-- =====================================================

DELIMITER $$

CREATE PROCEDURE RegistrarInternacao(
    IN p_codp INT,
    IN p_nroleito INT,
    IN p_data_entrada DATE,
    IN p_motivo VARCHAR(100),
    IN p_codm_responsavel INT,
    OUT p_msg VARCHAR(100)
)
BEGIN

    DECLARE status_leito VARCHAR(20);

    SELECT status
    INTO status_leito
    FROM leito
    WHERE nroleito = p_nroleito;

    IF(status_leito = 'ocupado') THEN

        SET p_msg = 'Leito indisponível';

    ELSE

        INSERT INTO internacao (
            codinternacao,
            codp,
            nroleito,
            data_entrada,
            motivo,
            codm_responsavel
        )
        VALUES (
            200,
            p_codp,
            p_nroleito,
            p_data_entrada,
            p_motivo,
            p_codm_responsavel
        );

        UPDATE leito
        SET status = 'ocupado'
        WHERE nroleito = p_nroleito;

        SET p_msg = 'Internação registrada';

    END IF;

END $$

DELIMITER ;

-- =====================================================
-- EXERCÍCIO 7
-- =====================================================

DELIMITER $$

CREATE PROCEDURE RelatorioInternacoes(
    IN data_inicio DATE,
    IN data_fim DATE,
    OUT total_internacoes INT
)
BEGIN

    SELECT COUNT(*)
    INTO total_internacoes
    FROM internacao
    WHERE data_entrada BETWEEN data_inicio AND data_fim;

END $$

DELIMITER ;

-- =====================================================
-- EXERCÍCIO 8
-- =====================================================

DELIMITER $$

CREATE PROCEDURE AtualizarEstoque(
    IN p_codmed INT,
    IN p_codforn INT,
    IN p_lote VARCHAR(50),
    IN quantidade_adicionada INT,
    OUT mensagem VARCHAR(100)
)
BEGIN

    START TRANSACTION;

    UPDATE estoque
    SET quantidade = quantidade + quantidade_adicionada
    WHERE codmed = p_codmed
    AND codforn = p_codforn
    AND lote = p_lote;

    COMMIT;

    SET mensagem = 'Estoque atualizado';

END $$

DELIMITER ;

-- =====================================================
-- EXERCÍCIO 9
-- =====================================================

DELIMITER $$

CREATE PROCEDURE EstatisticasPaciente(
    IN p_codp INT,
    OUT total_consultas INT,
    OUT total_internacoes INT,
    OUT total_exames INT
)
BEGIN

    SELECT COUNT(*)
    INTO total_consultas
    FROM consulta
    WHERE codp = p_codp;

    SELECT COUNT(*)
    INTO total_internacoes
    FROM internacao
    WHERE codp = p_codp;

    SELECT COUNT(*)
    INTO total_exames
    FROM exame
    WHERE codp = p_codp;

END $$

DELIMITER ;

-- =====================================================
-- EXERCÍCIO 10
-- =====================================================

DELIMITER $$

CREATE PROCEDURE InserirResultadoExame(
    IN p_codexame INT,
    IN p_codtipo INT,
    IN p_valor_obtido VARCHAR(100),
    IN p_observacao VARCHAR(100),
    OUT mensagem VARCHAR(100)
)
BEGIN

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET mensagem = 'Erro ao inserir resultado';
    END;

    START TRANSACTION;

    INSERT INTO resultado_exame (
        codexame,
        codtipo,
        valor_obtido,
        observacao
    )
    VALUES (
        p_codexame,
        p_codtipo,
        p_valor_obtido,
        p_observacao
    );

    COMMIT;

    SET mensagem = 'Resultado inserido';

END $$

DELIMITER ;

-- =====================================================
-- EXERCÍCIO 11
-- =====================================================

CREATE VIEW vw_PacientesDoencas AS
SELECT
    p.nome AS paciente,
    p.idade,
    p.cidade,
    d.nome AS doenca
FROM paciente p
INNER JOIN sofre s
ON p.codp = s.codp
INNER JOIN doenca d
ON s.codd = d.codd;

-- =====================================================
-- EXERCÍCIO 12
-- =====================================================

CREATE VIEW vw_ConsultasMedicos AS
SELECT
    p.nome AS paciente,
    m.nome AS medico,
    m.especialidade,
    c.data,
    c.hora
FROM consulta c
INNER JOIN paciente p
ON c.codp = p.codp
INNER JOIN medico m
ON c.codm = m.codm;

-- =====================================================
-- EXERCÍCIO 13
-- =====================================================

CREATE VIEW vw_EstoqueMedicamentos AS
SELECT
    m.nome,
    m.principio_ativo,
    SUM(e.quantidade) AS quantidade_total,
    SUM(m.preco_unitario * e.quantidade) AS valor_total
FROM medicamento m
INNER JOIN estoque e
ON m.codmed = e.codmed
GROUP BY m.nome, m.principio_ativo;

-- =====================================================
-- EXERCÍCIO 14
-- =====================================================

CREATE VIEW vw_CirurgiasRealizadas AS
SELECT
    c.data,
    c.tipo_cirurgia,
    c.sala,
    m.nome AS cirurgiao_principal,
    pc.funcao AS auxiliar
FROM cirurgia c
INNER JOIN medico m
ON c.codm_cirurgiao = m.codm
LEFT JOIN participa_cirurgia pc
ON c.codcirurgia = pc.codcirurgia;

-- =====================================================
-- EXERCÍCIO 15
-- =====================================================

CREATE VIEW vw_ExamesPacientes AS
SELECT
    p.nome AS paciente,
    t.nome AS tipo_exame,
    e.data,
    e.hora,
    r.valor_obtido
FROM exame e
INNER JOIN paciente p
ON e.codp = p.codp
INNER JOIN tipo_exame t
ON e.codtipo = t.codtipo
INNER JOIN resultado_exame r
ON e.codexame = r.codexame;

-- =====================================================
-- EXERCÍCIO 16
-- =====================================================

DELIMITER $$

CREATE TRIGGER trg_VerificarLeito
BEFORE INSERT ON internacao
FOR EACH ROW
BEGIN

    DECLARE status_leito VARCHAR(20);

    SELECT status
    INTO status_leito
    FROM leito
    WHERE nroleito = NEW.nroleito;

    IF(status_leito = 'ocupado') THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Leito indisponível';

    ELSE

        UPDATE leito
        SET status = 'ocupado'
        WHERE nroleito = NEW.nroleito;

    END IF;

END $$

DELIMITER ;

-- =====================================================
-- EXERCÍCIO 17
-- =====================================================

DELIMITER $$

CREATE TRIGGER trg_ReduzirEstoque
AFTER INSERT ON item_prescricao
FOR EACH ROW
BEGIN

    UPDATE estoque
    SET quantidade = quantidade - NEW.quantidade
    WHERE codmed = NEW.codmed;

END $$

DELIMITER ;

-- =====================================================
-- EXERCÍCIO 18
-- =====================================================

DELIMITER $$

CREATE TRIGGER trg_PrevenirPrecoNegativo
BEFORE UPDATE ON medicamento
FOR EACH ROW
BEGIN

    IF(NEW.preco_unitario <= 0) THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Preço inválido';

    END IF;

END $$

DELIMITER ;

-- =====================================================
-- EXERCÍCIO 19
-- =====================================================
CREATE TABLE IF NOT EXISTS auditoria_exames (
    codexame INT,
    data_hora DATETIME,
    usuario VARCHAR(100),
    valor_obtido VARCHAR(100)
);

CREATE TRIGGER trg_AuditoriaExame
AFTER INSERT ON resultado_exame
FOR EACH ROW
INSERT INTO auditoria_exames (
    codexame,
    data_hora,
    usuario,
    valor_obtido
)
VALUES (
    NEW.codexame,
    NOW(),
    CURRENT_USER(),
    NEW.valor_obtido
);
-- =====================================================
-- EXERCÍCIO 20
-- =====================================================

DELIMITER $$

CREATE TRIGGER trg_PrevenirDeleteInternacao
BEFORE DELETE ON internacao
FOR EACH ROW
BEGIN

    IF(OLD.data_saida IS NULL) THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Internação ativa não pode ser excluída';

    END IF;

END $$

DELIMITER ;

-- =====================================================
-- TESTES
-- =====================================================

SHOW TRIGGERS;

SHOW PROCEDURE STATUS
WHERE Db = 'hospital';

SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';
