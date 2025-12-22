-- Criação prévia de tabela para os exercícios:
create table funcionarios (
	id int not null auto_increment,
    nome varchar(50) not null,
    salario decimal(10,2),
    setor varchar(30),
    primary key(id)
);


/*
	- A linguagem SQL é dividida em quatro tipos de instrução de linguagem primárias: DML, DDL, DCL e TCL.
    
		-- DML (Data Manipulation Language):
            select - Recuperar dados do banco de dados.
            insert - Inserir dados em uma tabela.
            update - Atualiza os dados existentes em um atabela.
            delete - Exclui registros de uma tabela.
			
*/


/* Comandos DML: São utilizados para o gerenciamento de dados dentro de objetos do banco. */

-- SELECT:
select * from funcionarios;

select nome,
	   setor as departamento
from funcionarios;


-- INSERT:
select * from funcionarios;

insert into funcionarios(nome,salario,setor) values('João',1000,''),
												   ('José',2000,''),
                                                   ('Alexandre',3000,'');
insert into funcionarios(nome,salario) values('Pedro',1000);
insert into funcionarios(nome,salario) values('Cleiton',1080);

insert into funcionarios(nome,salario) values('Pedro','erroAqui'); -- Retorna um erro.
insert into funcionarios(nome,salario) values('Pedro','1500'); -- Não retorna erro.


-- UPDATE:
select * from funcionarios;

update funcionarios 
set salario = 1500 
where id = 1;

update funcionarios
set salario = salario * 1.5
where id = 2;

update funcionarios
set salario = salario * 1.5,
	setor = 'TI'
where id <> '1';


-- DELETE:
select * from funcionarios;

delete from funcionarios
where id = 1;
