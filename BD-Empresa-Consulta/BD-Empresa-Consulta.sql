/* A) */
select Datanasc, Endereco, Pnome, Minicial, Unome 
from Funcionario
where Pnome = 'João' and Minicial = 'B' and Unome = 'Silva';

/* B) Usando join */
select Pnome, Minicial, Unome, Endereco
from Funcionario join Departamento on Dnr = Dnumero and Dnome = 'Pesquisa';

/* B) Usando multiplicação */
select Pnome, Minicial, Unome, Endereco
from Funcionario, Departamento
where Dnr = Dnumero and Dnome = 'Pesquisa';

/* C) */
select Projnumero, Dnome
from Projeto join Departamento on Dnum = Dnumero and Projlocal = 'São Paulo'; 

/* D) */
select F.Pnome, F.Unome, S.Pnome AS Psupervisor, S.Unome AS Usupervisor
from Funcionario F join Funcionario S on F.Cpf_supervisor = S.Cpf;

/* E) */ 
select Salario
from Funcionario;

/* F) */
select distinct Salario
from Funcionario;

/* G) */
 select Datanasc, Pnome, Minicial, Unome
 from Funcionario
 where Datanasc like '196_-__-__';

/* H) */
select distinct A.Pnome, A.Minicial, A.Salario 
from Funcionario A join Funcionario B on A.Dnr = 5 and A.Salario between 30.000 and 40.000;

/* I) */
select *
from Funcionario
order by Pnome;

/* J */
select Pnome
from Funcionario
where Cpf_supervisor is null;

/* L */
select distinct Pnome, Minicial, Unome
from Funcionario F join Dependente S on F.Cpf = S.Fcpf;

/* M */
select Pnome, Salario * 1.15 As NovoSalario
from Funcionario;

/* N */
update Departamento set Cpf_gerente = '12345678966' where Dnumero = 5;
update Departamento set Data_inicio_gerente = '2007-10-01' where Dnumero = 5;

/* O */
insert into Dependente values ('45345345376', 'João', 'M', '1990-12-12', 'marido');

/* P */
delete from Dependente
where Nome_dependente = 'João';