-- 1 exercicio
select * from alunos where turma_id = 1;

-- 2 exercicio
select * from alunos order by nome asc;

-- 3 exercicio
select nome, data_nascimento from alunos where data_nascimento > '2010-01-01';

-- 4 exercício
SELECT turma_id, COUNT(turma_id) as alunos_turma from alunos group by turma_id order by turma_id;

-- 5 exercicio
select d.nome, avg(n.nota) as media_notas
from notas n
join disciplinas d on d.id = n.disciplina_id
group by
d.nome;

-- 6 exercicio	
select a.nome as Nome_Alunos, p.nome as Nome_Professores, t.nome as Nome_Turmas
from turmas t
inner join alunos a on a.id = t.id
inner join professores p on p.id = t.professor_id;

-- 7 exercicio
select a.nome as nome_aluno, n.nota,
case
	when n.nota < 7 then 'reprovado'
	when n.nota >= 7 then 'aprovado'
	else 'aprovado com honras'
end as status_nota
from notas n
join alunos a on a.id = n.aluno_id;

-- 8 exercicio
DELIMITER //

CREATE PROCEDURE CalcularMediaAluno (
    IN p_aluno_id INT,
    OUT p_media_final DECIMAL(5, 2)
)
BEGIN
    DECLARE temp_media DECIMAL(5, 2);

    SELECT AVG(nota)
    INTO temp_media
    FROM notas
    WHERE aluno_id = p_aluno_id;

    IF temp_media IS NULL THEN
        SET p_media_final = 0.00;
    ELSE
        SET p_media_final = temp_media;
    END IF;
END //
DELIMITER ;

-- 9 exercicio
DELIMITER //
CREATE PROCEDURE listar_alunos_por_turma(IN turma_id_param INT)
BEGIN
    SELECT
        a.id AS aluno_id,
        a.nome AS nome_aluno,
        a.email,
        a.data_nascimento,
        t.nome AS nome_turma
    FROM
        alunos a
    JOIN
        turmas t ON a.turma_id = t.id
    WHERE
        a.turma_id = turma_id_param;
END //
DELIMITER ;

-- 10 exercicio (mesmo que 7)
select a.nome as nome_aluno, n.nota,
case
	when n.nota < 7 then 'reprovado'
	when n.nota >= 7 then 'aprovado'
	else 'aprovado com honras'
end as status_nota
from notas n
join alunos a on a.id = n.aluno_id;

-- 11 exercicio
select a.nome as nome_aluno, n.nota
from notas n
join alunos a on a.id = aluno_id order by n.nota desc;

select * from alunos;
select * from professores;
select * from turmas;
select * from notas;