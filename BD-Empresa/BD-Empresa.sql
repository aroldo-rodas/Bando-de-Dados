CREATE SCHEMA Empresa72;
use Empresa72;

CREATE TABLE Funcionario (
	Pnome VARCHAR(50) NOT NULL,
    Minicial CHAR(1) NOT NULL,
    Unome VARCHAR(50) NOT NULL,
    Cpf CHAR(11) NOT NULL,
    PRIMARY KEY (Cpf),
    Datanasc DATE NOT NULL,
    Endereco VARCHAR(50) NOT NULL,
    Sexo CHAR(1) CHECK(Sexo in ('F', 'M')),
    Salario DECIMAL(8,2) NOT NULL,
    Cpf_supervisor CHAR(11) NULL
    
);

CREATE TABLE Departamento (
	Dnome VARCHAR(30) NOT NULL,
    Dnumero INT NOT NULL,
    PRIMARY KEY (Dnumero),
    Cpf_gerente CHAR(11) NULL,
    FOREIGN KEY (Cpf_gerente) REFERENCES Funcionario (Cpf),
    Data_inicio_gerente DATE NOT NULL
);

CREATE TABLE Localizacoes_Dep (
	Dnumero INT NOT NULL,
    Dlocal VARCHAR(50),
    FOREIGN KEY (Dnumero) REFERENCES Departamento (Dnumero)
);

CREATE TABLE Projeto (
	Projnome VARCHAR(50),
    Projnumero INT NOT NULL,
    PRIMARY KEY (Projnumero),
    Projlocal VARCHAR(50),
    Dnum INT NOT NULL,
    FOREIGN KEY (Dnum) REFERENCES Departamento (Dnumero)
);

CREATE TABLE Trabalha_Em (
	Fcpf CHAR(11) NOT NULL,
    Pnr INT NOT NULL,
    Horas TIME,
    PRIMARY KEY (Fcpf, Pnr),
    FOREIGN KEY (Fcpf) REFERENCES Funcionario (Cpf),
    FOREIGN KEY (Pnr) REFERENCES Projeto (Projnumero)
);

CREATE TABLE Dependente (
	Fcpf CHAR(11) NOT NULL,
    Nome_dependente VARCHAR(50) NOT NULL,
    Sexo CHAR(1) CHECK(Sexo in ('F', 'M')),
    Datanasc DATE NOT NULL,
    Parentesco VARCHAR(50),
    PRIMARY KEY (Fcpf, Nome_dependente),
    FOREIGN KEY (Fcpf) REFERENCES Funcionario (Cpf)
);

alter table Funcionario add column Dnr INT;
alter table Funcionario add constraint fk_Dnr foreign key (Dnr) references Departamento (Dnumero);

insert into Departamento values ('Pesquisa', 5, null, '1988-05-22'), ('Administração', 4, null, '1995-01-01'), ('Matriz', 1, null, '1981-06-19');
insert into Funcionario values ('Jorge', 'E', 'Brito', '88866555576', '1937-11-10', 'Rua do horto, 35, São Paulo, SP', 'M', 55.000, null, 1),
 ('Fernando', 'T', 'Wong', '33344555587', '1955-12-08', 'Rua da Lapa, 34, São Paulo, SP', 'M', 40.000, '88866555576', 5),
 ('Jennifer', 'S', 'Souza', '98765432168', '1941-06-20', 'Av. Arthur de Lima, 54, Curitiba, PR', 'F', 43.000, '88866555576', 4), 
 ('João', 'B', 'Silva', '12345678966', '1965-01-09', 'Rua das Flores, 751, São Paulo, SP', 'M', 30.000, '33344555587', 5), 
 ('Ronaldo', 'K', 'Lima', '66688444476', '1962-09-15', 'Rua Rebouças, 65, Piracicaba, SP', 'M', 38.000, '33344555587', 5), 
 ('Joice', 'A', 'Leite', '45345345376', '1972-07-31', 'Av. Lucas Obes, 74, São Paulo, SP', 'F', 25.000, '33344555587', 5),
 ('Alice', 'J', 'Zelaya', '99988777767', '1968-01-19', 'Rua Souza Lima, 35, Curitiba, PR', 'F', 25.000, '98765432168', 4),
 ('André', 'V', 'Pereira', '98798798733', '1969-03-29', 'Rua Timbira, 35, São Paulo, SP', 'M', 25.000, '98765432168', 4);
 
update Departamento set Cpf_gerente = '33344555587' where Dnumero = 5;
update Departamento set Cpf_gerente = '98765432168' where Dnumero = 4;
update Departamento set Cpf_gerente = '66688444476' where Dnumero = 1;

insert into Localizacoes_Dep values (1, 'São Paulo'),
 (4, 'Mauá'), 
 (5, 'Santo André'), 
 (5, 'Itu'), 
 (5, 'São Paulo');
 
 insert into Projeto values ('ProdutoX', 1, 'Santo André', 5),
 ('ProdutoY', 2, 'Itu', 5),
 ('ProdutoZ', 3, 'São Paulo', 5),
 ('Informatização', 10, 'Mauá', 4), 
 ('Reorganização', 20, 'São Paulo', 1), 
 ('Novosbenefícios', 30, 'Mauá', 4);
 
 insert into Trabalha_Em values ('12345678966', 1, '32:30:00'),
 ('12345678966', 2, '07:30:00'), 
 ('66688444476', 3, '40:00:00'),
 ('45345345376', 1, '20:00:00'),
 ('45345345376', 2, '20:00:00'),
 ('33344555587', 2, '10:00:00'),
 ('33344555587', 3, '10:00:00'),
 ('33344555587', 10, '10:00:00'),
 ('33344555587', 20, '10:00:00'),
 ('99988777767', 30, '30:00:00'),
 ('99988777767', 10, '10:00:00'),
 ('98798798733', 10, '35:00:00'),
 ('98798798733', 30, '05:00:00'),
 ('98765432168', 30, '20:00:00'),
 ('98765432168', 20, '15:00:00'),
 ('88866555576', 20, null);

insert into Dependente values ('33344555587', 'Alicia', 'F', '1986-05-05', 'Filha'),
('33344555587', 'Tiago', 'M', '1983-10-25', 'Filho'),
('33344555587', 'Janaína', 'F', '1958-05-03', 'Esposa'),
('98765432168', 'Antonio', 'M', '1942-02-28', 'Marido'),
('12345678966', 'Michael', 'M', '1988-01-04', 'Filho'),
('12345678966', 'Alicia', 'F', '1988-12-30', 'Filha'),
('12345678966', 'Elizabeth', 'F', '1967-05-05', 'Esposa');

 

