create schema BANCO;
use BANCO;

create table banco (
	nome varchar(50),
    codigo int not null,
    primary key (codigo)
);

create table agencia (
	cod_banco int not null,
    foreign key (cod_banco) references banco (codigo),
    numero_agencia int  not null,
    primary key (numero_agencia, cod_banco),
    endereco varchar(50)
);

create table cliente (
	cpf varchar(14) not null,
    primary key (cpf),
    nome varchar(50),
    sexo varchar(1) check(sexo in ('F', 'M')),
    endereco varchar(50)
);

create table conta (
	numero_conta varchar(7) not null,
    primary key (numero_conta),
    saldo float(15,2),
    tipo_conta int,
    num_agencia int,
    foreign key (num_agencia) references agencia(numero_agencia)
);

create table historico (
	cpf_cliente varchar(14) not null,
    foreign key (cpf_cliente) references cliente (cpf),
    num_conta varchar(7),
    foreign key (num_conta) references conta (numero_conta),
    data_inicio date,
    primary key(cpf_cliente, num_conta)
);

create table telefone_cliente (
	cpf_cli varchar(14) not null,
    foreign key (cpf_cli) references cliente(cpf),
    telefone varchar(13),
    primary key (telefone, cpf_cli)
);

/* Inserção de dados */
insert into banco values ('Banco do Brasil', 1), ('CEF', 4);

insert into agencia values (4, 0562, 'Rua Joaquim Teixeira Alves, 1555'), (1, 3153, 'Av. Marcelino Pires, 1960');

insert into cliente values ('111.222.333-44', 'Jennifer B Sousa', 'F', 'Rua Cuiabá, 1050'), ('666.777.888-99', 'Caetano K Lima', 'M', 'Rua ivinhema, 8879'), ('555.444.777-33', 'Silvano Macedo', 'M', 'Rua Estados Unidos, 735');

insert into conta values ('86340-2', 763.05, 2, 3153), ('23584-7', 3879.15, 1, 0562);

insert into historico values ('111.222.333-44', '23584-7', '1997-12-17'), ('666.777.888-99', '23584-7', '1997-12-17'), ('555.444.777-33', '86340-2', '2010-11-29');

insert into telefone_cliente values ('111.222.333-44', '(67)3422-7788'),  ('666.777.888-99', '(67)3423-9900'), ('666.777.888-99', '(67)8121-8833');

/* -----Atividades----- */

/* 4 */
alter table cliente add column email varchar(30) null;

/* 5 */
select endereco, cpf
from cliente
where nome = 'Paulo A Lima';

/* 6 */
select numero_agencia, endereco
from agencia
where cod_banco = 1;

/* 7 */
select c.nome, h.num_conta, t.num_agencia
from cliente c join historico h join conta t on c.cpf = h.cpf_cliente and h.num_conta = numero_conta;

/* 8 */
select *
from cliente
where sexo = 'M';

/* 9 */
select *
from agencia, banco
where agencia.cod_banco = banco.codigo and numero_agencia = 0562;

/* 10 - Você pode deletar primeiro o registro da OUTRA tabela e depois deletar o seu registro */
delete from historico where num_conta = '86340-2';
delete from conta where numero_conta = '86340-2';

/* 11 */
SET FOREIGN_KEY_CHECKS=0;
update agencia set numero_agencia = 6342 where numero_agencia = 0562;

/* 12 */
update cliente set email = 'caetanolima@gmail.com' where nome = 'Caetano K Lima';

/* 13 */
update conta set saldo =  saldo * 1.1 where numero_conta = '23584-7';
