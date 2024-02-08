-- Criando o banco de dados da Academia.
CREATE DATABASE aislan_fit
go

use aislan_fit
go

-- Tabela Aluno
CREATE TABLE Aluno (
    id_aluno INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(50),
    data_nascimento DATE,
    genero VARCHAR(10),
    endereco VARCHAR(100),
    telefone VARCHAR(15),
    email VARCHAR(50)
);

-- Tabela Instrutor
CREATE TABLE Instrutor (
    id_instrutor INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(50),
    especialidade VARCHAR(50),
    telefone VARCHAR(15),
    email VARCHAR(50)
);

-- Tabela Aula
CREATE TABLE Aula (
    id_aula INT PRIMARY KEY IDENTITY(1,1),
    nome_aula VARCHAR(50),
    horario TIME,
    id_instrutor INT,
    capacidade_maxima INT,
    descricao VARCHAR(300),
    FOREIGN KEY (id_instrutor) REFERENCES Instrutor (id_instrutor)
);

-- Tabela Matricula
CREATE TABLE Matricula (
    id_matricula INT PRIMARY KEY IDENTITY(1,1),
    data_inicio DATE,
    id_aluno INT,
    plano_treinamento VARCHAR(50),
    status_matricula VARCHAR(20),
    FOREIGN KEY (id_aluno) REFERENCES Aluno (id_aluno)
);

-- Tabela PlanoTreinamento
CREATE TABLE PlanoTreinamento (
    id_plano INT PRIMARY KEY IDENTITY(1,1),
    nome_plano VARCHAR(50),
    descricao VARCHAR(300),
    preco DECIMAL(10,2)
);

-- Tabela Presenca
CREATE TABLE Presenca (
    id_presenca INT PRIMARY KEY IDENTITY(1,1),
    data_aula DATE,
	horario TIME,
    id_aluno INT,
    id_aula INT,
    FOREIGN KEY (id_aluno) REFERENCES Aluno (id_aluno),
    FOREIGN KEY (id_aula) REFERENCES Aula (id_aula)
);


-- Inserindo dados

-- Inserindo dados na tabela Aluno
INSERT INTO Aluno (nome, data_nascimento, genero, endereco, telefone, email)
VALUES 
    ('João Silva', '1990-05-15', 'Masculino', 'Rua A, 123', '(11) 98765-4321', 'joao.silva@email.com'),
    ('Maria Oliveira', '1985-08-22', 'Feminino', 'Avenida B, 456', '(21) 99876-5432', 'maria.oliveira@email.com'),
    ('Pedro Santos', '1995-03-10', 'Masculino', 'Rua C, 789', '(31) 98765-1098', 'pedro.santos@email.com');

-- Inserindo dados na tabela Instrutor
INSERT INTO Instrutor (nome, especialidade, telefone, email)
VALUES 
    ('Ana Pereira', 'Musculação', '(11) 87654-3210', 'ana.pereira@email.com'),
    ('Carlos Lima', 'Aeróbica', '(21) 98765-4321', 'carlos.lima@email.com'),
    ('Fernanda Costa', 'Yoga', '(31) 87654-3210', 'fernanda.costa@email.com');

-- Inserindo dados na tabela Aula
INSERT INTO Aula (nome_aula, horario, id_instrutor, capacidade_maxima, descricao)
VALUES 
    ('Musculação', '08:00:00', 1, 20, 'Treino de força com pesos'),
    ('Aeróbica', '18:30:00', 2, 30, 'Aula de exercícios aeróbicos'),
    ('Yoga', '10:00:00', 3, 15, 'Prática de Yoga para relaxamento');

-- Inserindo dados na tabela Matricula
INSERT INTO Matricula (data_inicio, id_aluno, plano_treinamento, status_matricula)
VALUES 
    ('2023-01-10', 1, 'Plano Iniciante', 'Ativa'),
    ('2023-02-05', 2, 'Plano Intermediário', 'Ativa'),
    ('2023-03-15', 3, 'Plano Avançado', 'Suspensa');

-- Inserindo dados na tabela PlanoTreinamento
INSERT INTO PlanoTreinamento (nome_plano, descricao, preco)
VALUES 
    ('Plano Iniciante', 'Treino leve para iniciantes', 50.00),
    ('Plano Intermediário', 'Treino moderado para quem já treina', 75.00),
    ('Plano Avançado', 'Treino intenso para atletas avançados', 100.00);

-- Inserindo dados na tabela Presenca
INSERT INTO Presenca (data_aula, horario, id_aluno, id_aula)
VALUES 
    ('2023-01-15', '08:00:00', 1, 1),
    ('2023-02-05', '18:30:00', 2, 2),
    ('2023-03-20', '10:00:00', 3, 3);
