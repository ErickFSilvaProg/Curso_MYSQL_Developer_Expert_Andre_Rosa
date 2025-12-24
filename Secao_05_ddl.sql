/*
	- A linguagem SQL é dividida em quatro tipos de instrução de linguagem primárias: DML, DDL, DCL e TCL.
    
        -- DDL (Data Definition Languagem):
            CREATE - Cria objetos no banco de dados, o próprio banco, as tabelas, os indexes, as procedures, as views, as functions e as trigges.
            ALTER - Altera a estrutura da base de dados, o próprio banco de dados, as tabelas e os indexes.
            DROP - Apaga objetos do banco de dados, o próprio banco de dados, as tabelas, os indexes, os procedures, as views, as functions e as triggers.
            TRUNCATE - Remove todos os registros de uma tabela, incluindo os espaços alocados para os registros.
            
*/


show databases;
show tables;

desc curso.funcionario;
desc curso.funcionarios;
desc curso.senso;

select * from curso.senso;

use curso;


/* Comandos DDL: São usadas para definir a estrutura de um banco de dados ou esquema. */

-- CREATE:
create table curso.funcionario(
	matricula int not null auto_increment,
    nome varchar(50) not null,
    sobrenome varchar(50) not null,
    endereco varchar(50),
    cidade varchar(50),
    pais varchar(25),
    data_nasc datetime,
    primary key(matricula)
);

create table curso.salario(
	matricula int not null,
    salario decimal(10,2) not null,
    foreign key(matricula) references funcionario(matricula)
);

create table curso.audit_salario(
	transacao int primary key auto_increment,
    matricula int not null,
    data_transacao datetime not null,
    sal_antigo decimal(10,2),
    sal_novo decimal(10,2),
    usuario varchar(20) not null,
    foreign key(matricula) references curso.funcionario(matricula)
);

create table endereco(
    matricula int not null,
    rua varchar(40) not null,
    numero varchar(6) not null,
    bairro varchar(40) not null,
    cidade varchar(30) not null,
    estado varchar(30) not null,
    pais varchar(30) not null,
    foreign key(matricula) references funcionario(matricula)
);

create temporary table tmp_funcionarios(
    id int,
    nome varchar(50),
    salario decimal(10,2),
    setor varchar(30)
);

    insert into curso.tmp_funcionarios
    select * from curso.funcionarios;

    select * from tmp_funcionarios;
    select * from funcionarios;

    alter table funcionarios
    change id id int unsigned not null;

    insert into funcionarios
    select * from tmp_funcionarios;

    alter table funcionarios
    modify column id int auto_increment;

    insert into funcionarios(nome,salario) values('Leopoldo',1000);

create index ix_func1 
on curso.funcionario(data_nasc);
create index ix_func2 
on curso.funcionario(cidade,pais);

create index ix_func1 
on curso.funcionarios(nome);

create index ix_func2 
on curso.funcionarios(setor);


create database teste;

create view v_funcionarios 
as select * from funcionarios;

delimiter $$
create procedure proc_quadrado(inout numero int)
begin
    set numero = numero * numero;
end
delimiter ;

    set @valor = 5;
    call proc_quadrado(@valor);
    select @valor;


-- ALTER:
alter table curso.funcionario
add genero char(1)
after sobrenome;

alter table curso.funcionario
change genero sexo char(1) not null;

alter table curso.senso
add id int;

alter table curso.senso
modify column id int auto_increment primary key;

alter table curso.funcionario
modify column endereco varchar(30);

alter table curso.funcionario
drop column sexo;

alter view v_funcionarios
as select id, nome from funcionarios;


-- RENAME:
rename table curso.funcionario
to curso.pessoa;

rename table curso.pessoa
to curso.funcionario;


-- DROP:
drop database teste;

drop table curso.salario;

drop table curso.endereco;

drop view curso.v_funcionarios;

drop index ix_func1
on curso.funcionario;

drop index ix_func2
on curso.funcionario;

drop procedure proc_quadrado;

drop function curso.func_salario;

drop trigger curso.trig_func_salario;


-- TRUNCATE:
truncate curso.endereco;

truncate curso.funcionarios;

    select * from funcionarios;