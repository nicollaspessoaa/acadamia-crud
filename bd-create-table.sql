CREATE DATABASE academia;
USE academia;

CREATE TABLE aluno (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(20) UNIQUE NOT NULL,
    plano VARCHAR(50),
    data_matricula DATE
);
