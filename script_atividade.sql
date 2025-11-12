CREATE DATABASE Teste;
SHOW DATABASES;
use Teste;
CREATE TABLE Alunos (  
	id INT AUTO_INCREMENT PRIMARY KEY,     
    nome VARCHAR(100) NOT NULL,  idade INT,     
    disciplina VARCHAR(50) 
);

INSERT INTO Alunos (nome, idade, disciplina) VALUES
('Ana Silva', 20, 'Modelagem de Sistema'),
('Bruno Costa', 22, 'Matemática'),
('Carla Rocha', 21, 'História'),
('Daniel Lima', 19, 'Banco de Dados'),
('Eduarda Pires', 23, 'Literatura'),
('Fábio Nunes', 20, 'Programação de Aplicativos'),
('Gabriela Souza', 22, 'Inglês'),
('Henrique Melo', 21, 'Programação Mobile'),
('Isabella Vieira', 19, 'Geografia'),
('João Santos', 23, 'Física'),
('Karen Oliveira', 20, 'Modelagem de Sistema'),
('Lucas Martins', 22, 'Química'),
('Marina Fernandes', 21, 'Sociologia'),
('Rafael Pereira', 19, 'Banco de Dados'),
('Sofia Almeida', 23, 'Arte'),
('Thiago Gomes', 20, 'Programação de Aplicativos'),
('Vanessa Ribeiro', 22, 'Biologia'),
('William Castro', 21, 'Programação Mobile'),
('Amanda Barbosa', 19, 'Filosofia'),
('Pedro Cruz', 23, 'Estatística'),
('Luiza Mendes', 20, 'Modelagem de Sistema'),
('Victor Santos', 22, 'Cálculo'),
('Helena Ferreira', 21, 'Banco de Dados'),
('Gustavo Ramos', 19, 'Redes de Computadores'),
('Laura Becker', 23, 'Programação de Aplicativos'),
('Ricardo Vaz', 20, 'Economia'),
('Clara Sales', 22, 'Programação Mobile'),
('Felipe Gomes', 21, 'Psicologia'),
('Alice Dias', 19, 'Modelagem de Sistema'),
('Marcelo Lopes', 23, 'Lógica');

-- 1°Exercicio
SELECT * FROM Alunos;

-- 2° Exercício
SELECT nome, idade FROM Alunos;

-- 3° Exercício
SELECT * FROM Alunos WHERE disciplina = 'Modelagem de Sistema';

-- 4° Exercício
SELECT * FROM Alunos WHERE idade >= 19;

-- 5° Exercício
SELECT * FROM Alunos ORDER BY nome ASC;

-- 6° Exercício
SELECT * FROM Alunos ORDER BY idade ASC;

-- 7° Exercício
SELECT * FROM Alunos WHERE disciplina = 'Banco de Dados' OR disciplina = 'Programação de Aplicativos';

-- 8° Exercício
SELECT COUNT(*) AS CONTAGEM_ALUNOS FROM Alunos;	

-- 9° Exercício
SELECT AVG(idade) AS IDADE_MEDIA FROM Alunos;

-- 10° Exercício
SELECT disciplina, COUNT(id) AS total_alunos
FROM Alunos
GROUP BY disciplina;

-- 11° Exercício
UPDATE Alunos
SET idade = 19 
WHERE id = 1;

-- 12° Exercício
UPDATE Alunos
SET disciplina = 'Programação Mobile'
WHERE disciplina = 'Programação de Aplicativos';

-- 13° Exercício
DELETE FROM Alunos 
WHERE id = 2;

-- 14° Exercício
ALTER TABLE Alunos
ADD COlUMN email VARCHAR(150);

-- 15° Exercício
ALTER TABLE Alunos
MODIFY COlUMN disciplina VARCHAR(150);

-- 16° Exercício
ALTER TABLE ALUNOS
DROP COLUMN email;

-- 17° Exercício
SELECT * FROM Alunos
WHERE nome LIKE 'A%';

-- 18° Exercício
SELECT * FROM Alunos
WHERE nome LIKE '%A';

-- 19° Exercício
SELECT * FROM Alunos
WHERE nome LIKE '%E%';

-- 20° Exercício
SELECT disciplina, AVG(idade) AS idade_media
FROM ALunos
GROUP BY disciplina
HAVING AVG(idade) > 19;

-- 21° Exercício
SELECT nome, idade 
FROM ALUNOS
WHERE idade  = (SELECT MAX(idade) FROM Alunos);
-- LIMIT 1 opcional se caso quer exibir somente 1

-- 22° Exercício
CREATE TABLE Alunos_BD AS
SELECT * FROM Alunos
WHERE disciplina = 'Banco de Dados';

/*
SHOW TABLES;
SELECT * FROM Alunos_BD;
Para caso queira ver, execute esses comandos.
*/


