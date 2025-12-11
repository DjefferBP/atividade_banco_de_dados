
create database hospital_mga;
use hospital_mga;

create table endereco (
	id_endereco int auto_increment primary key,
    rua varchar(120),
    numero varchar(10),
    bairro varchar(80),
    cidade varchar(80),
    estado varchar(2)
);

create table paciente (
	id_paciente int primary key auto_increment,
    cpf varchar(11) unique,
    nome varchar(120),
    data_nascmento date,
    telefone varchar(20),
    id_endereco int,
    foreign key (id_endereco) references endereco(id_endereco)
);

create table medico (
	id_medico int primary key auto_increment,
    crm varchar(20) unique,
    nome varchar(120),
    telefone varchar(20)
);

create table especialidade (
	id_especialidade int primary key auto_increment,
    nome varchar(80)
);

create table medico_especialidade(
	id_medico int,
    id_especialidade int,
    primary key (id_medico, id_especialidade),
    foreign key (id_medico) references medico(id_medico),
    foreign key (id_especialidade) references especialidade(id_especialidade)
);

create table consulta (
	id_consulta int primary key auto_increment,
    id_paciente int,
    id_medico int,
    data_hora datetime,
    descricao varchar(200),
    foreign key (id_paciente) references paciente(id_paciente),
    foreign key (id_medico) references medico(id_medico)
);

create table prescricao (
	id_prescricao int primary key auto_increment,
    id_consulta int,
    id_medicamento int,
    dose varchar (50),
    frequencia varchar(50),
    duracao_dias int,
    foreign key (id_consulta) references consulta(id_consulta),
    foreign key (id_medicamento) references medicamentos(id_medicamento)
);

create table leito (
	id_leito int primary key auto_increment,
    codigo varchar(20) unique,
    tipo varchar(50)
);

create table internacao (
	id_internacao int auto_increment primary key,
    id_paciente int,
    id_leito int,
    data_internacao date,
    data_alta date,
    motivo text,
    foreign key (id_paciente) references paciente(id_paciente),
    foreign key (id_leito) references leito(id_leito)
);

create table medicamentos (
	id_medicamento int auto_increment primary key,
    nome varchar(80),
    principio_ativo varchar(120)
);

create table exame (
	id_exame int primary key auto_increment,
    id_consulta int,
    tipo_exame varchar(100)
);

create table resultado_exame (
	id_resultado int primary key auto_increment,
    id_exame int unique,
    resultado text,
    data_resultado date
);

USE hospital_mga;

-- 1. Endereço
INSERT INTO endereco (rua, numero, bairro, cidade, estado) VALUES
('Rua das Flores', '123', 'Centro', 'São Paulo', 'SP'),
('Avenida Brasil', '456', 'Jardins', 'Rio de Janeiro', 'RJ'),
('Rua das Palmeiras', '789', 'Boa Viagem', 'Recife', 'PE'),
('Avenida Paulista', '1000', 'Bela Vista', 'São Paulo', 'SP'),
('Rua das Acácias', '55', 'Copacabana', 'Rio de Janeiro', 'RJ'),
('Alameda Santos', '200', 'Cerqueira César', 'São Paulo', 'SP'),
('Rua do Sol', '300', 'Boa Vista', 'Recife', 'PE'),
('Avenida das Américas', '400', 'Barra da Tijuca', 'Rio de Janeiro', 'RJ'),
('Rua da Paz', '25', 'Centro', 'Belo Horizonte', 'MG'),
('Avenida Beira Mar', '150', 'Meireles', 'Fortaleza', 'CE');

-- 2. Paciente
INSERT INTO paciente (cpf, nome, data_nascmento, telefone, id_endereco) VALUES
('12345678901', 'João Silva', '1985-05-15', '(11) 99999-1111', 1),
('23456789012', 'Maria Santos', '1990-08-22', '(21) 98888-2222', 2),
('34567890123', 'Pedro Oliveira', '1978-03-10', '(81) 97777-3333', 3),
('45678901234', 'Ana Costa', '1995-11-30', '(11) 96666-4444', 4),
('56789012345', 'Carlos Pereira', '1982-07-18', '(21) 95555-5555', 5),
('67890123456', 'Fernanda Lima', '2000-01-25', '(11) 94444-6666', 6),
('78901234567', 'Roberto Alves', '1975-12-05', '(81) 93333-7777', 7),
('89012345678', 'Juliana Souza', '1992-09-14', '(21) 92222-8888', 8),
('90123456789', 'Marcos Rocha', '1988-06-20', '(31) 91111-9999', 9),
('01234567890', 'Patrícia Mendes', '1998-04-12', '(85) 90000-0000', 10);

-- 3. Médico
INSERT INTO medico (crm, nome, telefone) VALUES
('CRM/SP 12345', 'Dr. Rodrigo Santos', '(11) 98888-1111'),
('CRM/RJ 23456', 'Dra. Amanda Costa', '(21) 97777-2222'),
('CRM/PE 34567', 'Dr. Marcelo Oliveira', '(81) 96666-3333'),
('CRM/SP 45678', 'Dra. Beatriz Lima', '(11) 95555-4444'),
('CRM/RJ 56789', 'Dr. Eduardo Pereira', '(21) 94444-5555'),
('CRM/SP 67890', 'Dra. Camila Silva', '(11) 93333-6666'),
('CRM/PE 78901', 'Dr. Rafael Almeida', '(81) 92222-7777'),
('CRM/MG 89012', 'Dra. Larissa Souza', '(31) 91111-8888'),
('CRM/CE 90123', 'Dr. Thiago Rocha', '(85) 90000-9999'),
('CRM/SP 01234', 'Dra. Vanessa Mendes', '(11) 89999-0000');

-- 4. Especialidade
INSERT INTO especialidade (nome) VALUES
('Cardiologia'),
('Dermatologia'),
('Pediatria'),
('Ortopedia'),
('Ginecologia'),
('Neurologia'),
('Oftalmologia'),
('Psiquiatria'),
('Endocrinologia'),
('Gastroenterologia');

-- 5. Médico_Especialidade
INSERT INTO medico_especialidade (id_medico, id_especialidade) VALUES
(1, 1), (1, 10),
(2, 2),
(3, 3), (3, 5),
(4, 4),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 1), (9, 3),
(10, 5), (10, 6);

-- 6. Consulta
INSERT INTO consulta (id_paciente, id_medico, data_hora, descricao) VALUES
(1, 1, '2024-01-15 09:00:00', 'Consulta de rotina - check-up cardíaco'),
(2, 2, '2024-01-16 10:30:00', 'Avaliação dermatológica'),
(3, 3, '2024-01-17 14:00:00', 'Consulta pediátrica'),
(4, 4, '2024-01-18 11:00:00', 'Avaliação ortopédica'),
(5, 5, '2024-01-19 15:30:00', 'Consulta neurológica'),
(6, 6, '2024-01-20 08:45:00', 'Exame oftalmológico'),
(7, 7, '2024-01-21 13:15:00', 'Acompanhamento psiquiátrico'),
(8, 8, '2024-01-22 16:00:00', 'Consulta endocrinológica'),
(9, 9, '2024-01-23 09:30:00', 'Avaliação cardíaca'),
(10, 10, '2024-01-24 14:45:00', 'Consulta ginecológica'),
(1, 2, '2024-01-25 10:00:00', 'Retorno dermatológico'),
(2, 3, '2024-01-26 11:30:00', 'Acompanhamento pediátrico'),
(3, 4, '2024-01-27 15:00:00', 'Retorno ortopédico'),
(4, 5, '2024-01-28 08:30:00', 'Nova avaliação neurológica');

-- 7. Medicamentos
INSERT INTO medicamentos (nome, principio_ativo) VALUES
('Losartana', 'Losartana Potássica'),
('Atorvastatina', 'Atorvastatina Cálcica'),
('Metformina', 'Cloridrato de Metformina'),
('Omeprazol', 'Omeprazol'),
('Amoxicilina', 'Amoxicilina Tri-Hidratada'),
('Dipirona', 'Dipirona Monoidratada'),
('Sinvastatina', 'Sinvastatina'),
('Captopril', 'Captopril'),
('Hidroclorotiazida', 'Hidroclorotiazida'),
('Dexametasona', 'Dexametasona');

-- 8. Prescrição
INSERT INTO prescricao (id_consulta, id_medicamento, dose, frequencia, duracao_dias) VALUES
(1, 1, '50mg', '1x ao dia', 30),
(1, 2, '20mg', '1x ao dia', 30),
(2, 6, '500mg', '6/6 horas se necessário', 5),
(3, 5, '500mg', '8/8 horas', 7),
(4, 4, '20mg', '1x ao dia', 15),
(5, 7, '40mg', '1x ao dia', 30),
(6, 10, '0,5mg', '2x ao dia', 7),
(7, 8, '25mg', '2x ao dia', 30),
(8, 9, '25mg', '1x ao dia', 30),
(9, 1, '100mg', '1x ao dia', 30),
(10, 3, '850mg', '2x ao dia', 60),
(11, 6, '1g', '8/8 horas se dor', 3),
(12, 5, '250mg', '8/8 horas', 10),
(13, 4, '40mg', '1x ao dia', 20);

-- 9. Leito
INSERT INTO leito (codigo, tipo) VALUES
('L-101', 'Enfermaria'),
('L-102', 'Enfermaria'),
('L-201', 'Apartamento'),
('L-202', 'Apartamento'),
('L-301', 'UTI Adulto'),
('L-302', 'UTI Adulto'),
('L-401', 'UTI Pediátrica'),
('L-402', 'UTI Pediátrica'),
('L-501', 'Isolamento'),
('L-502', 'Isolamento');

-- 10. Internação
INSERT INTO internacao (id_paciente, id_leito, data_internacao, data_alta, motivo) VALUES
(1, 5, '2024-01-10', '2024-01-20', 'Infarto agudo do miocárdio'),
(3, 7, '2024-01-12', '2024-01-18', 'Pneumonia grave'),
(5, 6, '2024-01-15', '2024-01-25', 'AVC isquêmico'),
(7, 9, '2024-01-18', '2024-01-28', 'COVID-19 grave'),
(9, 3, '2024-01-20', '2024-01-30', 'Pós-operatório cardíaco'),
(2, 1, '2024-01-22', '2024-01-27', 'Cirurgia dermatológica'),
(4, 4, '2024-01-25', '2024-02-05', 'Fratura exposta'),
(6, 2, '2024-01-28', '2024-02-02', 'Desidratação severa');

-- 11. Exame
INSERT INTO exame (id_consulta, tipo_exame) VALUES
(1, 'Eletrocardiograma'),
(1, 'Ecocardiograma'),
(2, 'Biópsia de pele'),
(3, 'Hemograma completo'),
(4, 'Radiografia de joelho'),
(5, 'Ressonância magnética cerebral'),
(6, 'Mapeamento de retina'),
(7, 'Escala de depressão de Hamilton'),
(8, 'Dosagem de TSH'),
(9, 'Teste ergométrico'),
(10, 'Ultrassonografia pélvica'),
(11, 'Cultura bacteriana'),
(12, 'Raio-X de tórax'),
(13, 'Tomografia computadorizada');

-- 12. Resultado_exame
INSERT INTO resultado_exame (id_exame, resultado, data_resultado) VALUES
(1, 'Ritmo sinusal normal, FC 72 bpm', '2024-01-15'),
(2, 'Função ventricular preservada, FE 65%', '2024-01-16'),
(3, 'Nevo melanocítico benigno', '2024-01-17'),
(4, 'Hemoglobina 14g/dL, leucócitos 7500/mm³', '2024-01-18'),
(5, 'Fraturas consolidadas, sem alterações agudas', '2024-01-19'),
(6, 'Área de isquemia em território da ACM esquerda', '2024-01-20'),
(7, 'Retinopatia hipertensiva grau I', '2024-01-21'),
(8, 'Escore 12 - depressão leve', '2024-01-22'),
(9, 'TSH 2.5 mUI/L - dentro da normalidade', '2024-01-23'),
(10, 'Teste negativo para isquemia, boa capacidade funcional', '2024-01-24'),
(11, 'Útero e ovários normais, sem alterações', '2024-01-25'),
(12, 'Cultura positiva para Staphylococcus aureus', '2024-01-26'),
(13, 'Pulmões sem infiltrados, coração de dimensões normais', '2024-01-27'),
(14, 'Fraturas múltiplas em processo de consolidação', '2024-01-28');

-- 1. Listar todos os pacientes com seus endereços completos
SELECT 
    p.id_paciente,
    p.nome,
    p.cpf,
    p.data_nascmento,
    p.telefone,
    CONCAT(e.rua, ', ', e.numero, ' - ', e.bairro) AS endereco,
    CONCAT(e.cidade, '/', e.estado) AS cidade_estado
FROM paciente p
INNER JOIN endereco e ON p.id_endereco = e.id_endereco
ORDER BY p.nome;

-- 2. Médicos e suas especialidades
SELECT 
    m.nome AS medico,
    m.crm,
    GROUP_CONCAT(es.nome SEPARATOR ', ') AS especialidades
FROM medico m
LEFT JOIN medico_especialidade me ON m.id_medico = me.id_medico
LEFT JOIN especialidade es ON me.id_especialidade = es.id_especialidade
GROUP BY m.id_medico, m.nome, m.crm
ORDER BY m.nome;

-- 3. Consultas agendadas para um período específico
SELECT 
    c.id_consulta,
    p.nome AS paciente,
    m.nome AS medico,
    DATE_FORMAT(c.data_hora, '%d/%m/%Y %H:%i') AS data_consulta,
    c.descricao
FROM consulta c
INNER JOIN paciente p ON c.id_paciente = p.id_paciente
INNER JOIN medico m ON c.id_medico = m.id_medico
WHERE c.data_hora BETWEEN '2024-01-15' AND '2024-01-31'
ORDER BY c.data_hora;

-- 4. Pacientes internados no momento (considerando que data_alta é futura ou NULL)
SELECT 
    i.id_internacao,
    p.nome AS paciente,
    l.codigo AS leito,
    l.tipo,
    i.data_internacao,
    i.data_alta,
    i.motivo,
    DATEDIFF(IFNULL(i.data_alta, CURDATE()), i.data_internacao) AS dias_internado
FROM internacao i
INNER JOIN paciente p ON i.id_paciente = p.id_paciente
INNER JOIN leito l ON i.id_leito = l.id_leito
WHERE i.data_alta IS NULL OR i.data_alta > CURDATE()
ORDER BY i.data_internacao DESC;

-- 5. Prescrições por médico
SELECT 
    m.nome AS medico,
    COUNT(pr.id_prescricao) AS total_prescricoes,
    GROUP_CONCAT(DISTINCT med.nome SEPARATOR ', ') AS medicamentos_prescritos
FROM medico m
INNER JOIN consulta c ON m.id_medico = c.id_medico
INNER JOIN prescricao pr ON c.id_consulta = pr.id_consulta
INNER JOIN medicamentos med ON pr.id_medicamento = med.id_medicamento
GROUP BY m.id_medico, m.nome
ORDER BY total_prescricoes DESC;

-- 6. Pacientes com mais consultas
SELECT 
    p.nome AS paciente,
    COUNT(c.id_consulta) AS total_consultas,
    MIN(c.data_hora) AS primeira_consulta,
    MAX(c.data_hora) AS ultima_consulta
FROM paciente p
INNER JOIN consulta c ON p.id_paciente = c.id_paciente
GROUP BY p.id_paciente, p.nome
HAVING total_consultas > 1
ORDER BY total_consultas DESC;

-- 7. Exames realizados e seus resultados
SELECT 
    p.nome AS paciente,
    e.tipo_exame,
    re.resultado,
    re.data_resultado,
    DATE_FORMAT(c.data_hora, '%d/%m/%Y') AS data_consulta
FROM exame e
INNER JOIN consulta c ON e.id_consulta = c.id_consulta
INNER JOIN resultado_exame re ON e.id_exame = re.id_exame
INNER JOIN paciente p ON c.id_paciente = p.id_paciente
ORDER BY re.data_resultado DESC;

-- 8. Leitos ocupados vs disponíveis
SELECT 
    tipo,
    COUNT(*) AS total_leitos,
    COUNT(i.id_internacao) AS leitos_ocupados,
    (COUNT(*) - COUNT(i.id_internacao)) AS leitos_disponiveis
FROM leito l
LEFT JOIN internacao i ON l.id_leito = i.id_leito 
    AND (i.data_alta IS NULL OR i.data_alta > CURDATE())
GROUP BY l.tipo
ORDER BY leitos_ocupados DESC;

-- 9. Prescrições mais comuns
SELECT 
    med.nome AS medicamento,
    med.principio_ativo,
    COUNT(pr.id_prescricao) AS vezes_prescrito,
    AVG(pr.duracao_dias) AS duracao_media_dias
FROM medicamentos med
INNER JOIN prescricao pr ON med.id_medicamento = pr.id_medicamento
GROUP BY med.id_medicamento, med.nome, med.principio_ativo
ORDER BY vezes_prescrito DESC;

-- 10. Pacientes por faixa etária
SELECT 
    CASE 
        WHEN TIMESTAMPDIFF(YEAR, data_nascmento, CURDATE()) < 18 THEN '0-17 anos'
        WHEN TIMESTAMPDIFF(YEAR, data_nascmento, CURDATE()) BETWEEN 18 AND 30 THEN '18-30 anos'
        WHEN TIMESTAMPDIFF(YEAR, data_nascmento, CURDATE()) BETWEEN 31 AND 50 THEN '31-50 anos'
        WHEN TIMESTAMPDIFF(YEAR, data_nascmento, CURDATE()) BETWEEN 51 AND 65 THEN '51-65 anos'
        ELSE 'Acima de 65 anos'
    END AS faixa_etaria,
    COUNT(*) AS total_pacientes,
    GROUP_CONCAT(nome SEPARATOR ', ') AS pacientes
FROM paciente
GROUP BY faixa_etaria
ORDER BY MIN(TIMESTAMPDIFF(YEAR, data_nascmento, CURDATE()));

-- 11. Consultas por especialidade (baseado no médico)
SELECT 
    es.nome AS especialidade,
    COUNT(c.id_consulta) AS total_consultas,
    COUNT(DISTINCT c.id_paciente) AS pacientes_unicos,
    COUNT(DISTINCT m.id_medico) AS medicos
FROM consulta c
INNER JOIN medico m ON c.id_medico = m.id_medico
INNER JOIN medico_especialidade me ON m.id_medico = me.id_medico
INNER JOIN especialidade es ON me.id_especialidade = es.id_especialidade
GROUP BY es.id_especialidade, es.nome
ORDER BY total_consultas DESC;

-- 12. Histórico completo de um paciente específico (ex: João Silva, id 1)
SELECT 
    'Consulta' AS tipo,
    DATE_FORMAT(c.data_hora, '%d/%m/%Y %H:%i') AS data,
    m.nome AS medico_responsavel,
    c.descricao AS detalhes,
    NULL AS medicamento
FROM consulta c
INNER JOIN medico m ON c.id_medico = m.id_medico
WHERE c.id_paciente = 1

UNION ALL

SELECT 
    'Prescrição' AS tipo,
    DATE_FORMAT(c.data_hora, '%d/%m/%Y') AS data,
    m.nome AS medico_responsavel,
    CONCAT('Medicamento: ', med.nome) AS detalhes,
    CONCAT(pr.dose, ' - ', pr.frequencia, ' por ', pr.duracao_dias, ' dias') AS medicamento
FROM prescricao pr
INNER JOIN consulta c ON pr.id_consulta = c.id_consulta
INNER JOIN medico m ON c.id_medico = m.id_medico
INNER JOIN medicamentos med ON pr.id_medicamento = med.id_medicamento
WHERE c.id_paciente = 1

UNION ALL

SELECT 
    'Internação' AS tipo,
    DATE_FORMAT(i.data_internacao, '%d/%m/%Y') AS data,
    'Hospital' AS medico_responsavel,
    CONCAT('Leito: ', l.codigo, ' - Motivo: ', i.motivo) AS detalhes,
    CONCAT('Alta: ', IFNULL(DATE_FORMAT(i.data_alta, '%d/%m/%Y'), 'Em andamento')) AS medicamento
FROM internacao i
INNER JOIN leito l ON i.id_leito = l.id_leito
WHERE i.id_paciente = 1

ORDER BY STR_TO_DATE(data, '%d/%m/%Y %H:%i') DESC;

-- 13. Médicos mais ativos (com base em consultas realizadas)
SELECT 
    m.nome AS medico,
    m.crm,
    COUNT(DISTINCT c.id_consulta) AS total_consultas,
    COUNT(DISTINCT pr.id_prescricao) AS prescricoes_realizadas,
    COUNT(DISTINCT e.id_exame) AS exames_solicitados
FROM medico m
LEFT JOIN consulta c ON m.id_medico = c.id_medico
LEFT JOIN prescricao pr ON c.id_consulta = pr.id_consulta
LEFT JOIN exame e ON c.id_consulta = e.id_consulta
GROUP BY m.id_medico, m.nome, m.crm
ORDER BY total_consultas DESC;

-- 14. Tempo médio de internação por tipo de leito
SELECT 
    l.tipo AS tipo_leito,
    COUNT(i.id_internacao) AS total_internacoes,
    AVG(DATEDIFF(i.data_alta, i.data_internacao)) AS tempo_medio_dias,
    MIN(DATEDIFF(i.data_alta, i.data_internacao)) AS menor_tempo,
    MAX(DATEDIFF(i.data_alta, i.data_internacao)) AS maior_tempo
FROM leito l
INNER JOIN internacao i ON l.id_leito = i.id_leito
WHERE i.data_alta IS NOT NULL
GROUP BY l.tipo
ORDER BY tempo_medio_dias DESC;

-- 15. Estatísticas mensais (ex: Janeiro 2024)
SELECT 
    MONTH(c.data_hora) AS mes,
    YEAR(c.data_hora) AS ano,
    COUNT(DISTINCT c.id_consulta) AS total_consultas,
    COUNT(DISTINCT c.id_paciente) AS pacientes_atendidos,
    COUNT(DISTINCT c.id_medico) AS medicos_ativos,
    COUNT(DISTINCT pr.id_prescricao) AS prescricoes,
    COUNT(DISTINCT e.id_exame) AS exames_solicitados
FROM consulta c
LEFT JOIN prescricao pr ON c.id_consulta = pr.id_consulta
LEFT JOIN exame e ON c.id_consulta = e.id_consulta
WHERE YEAR(c.data_hora) = 2024 AND MONTH(c.data_hora) = 1
GROUP BY YEAR(c.data_hora), MONTH(c.data_hora);