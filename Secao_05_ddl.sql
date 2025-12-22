/*
	- A linguagem SQL é dividida em quatro tipos de instrução de linguagem primárias: DML, DDL, DCL e TCL.
    
        -- DDL (Data Definition Languagem):
            CREATE - Cria objetos no banco de dados, o próprio banco, as tabelas, os indexes, as procedures, as views, as functions e as trigges.
            ALTER - Altera a estrutura da base de dados, o próprio banco de dados, as tabelas e os indexes.
            DROP - Apaga objetos do banco de dados, o próprio banco de dados, as tabelas, os indexes, os procedures, as views, as functions e as triggers.
            TRUNCATE - Remove todos os registros de uma tabela, incluindo os espaços alocados para os registros.
            
*/


/* Comandos DDL: São usadas para definir a estrutura de um banco de dados ou esquema. */

-- CREATE:
show tables;

create table funcionario(
	matricula int not null auto_increment,
    nome varchar(50) not null,
    sobrenome varchar(50) not null,
    endereco varchar(50),
    cidade varchar(50),
    pais varchar(25),
    data_nasc datetime,
    primary key(matricula)
);

create table salario(
	matricula int not null,
    salario decimal(10,2) not null,
    foreign key(matricula) references funcionario(matricula)
);

create table audit_salario (
	transacao int primary key auto_increment,
    matricula int not null,
    data_transacao datetime not null,
    sal_antigo decimal(10,2),
    sal_novo decimal(10,2),
    usuario varchar(20) not null,
    foreign key(matricula) references funcionario(matricula)
);

create index ix_func1 on funcionario(data_nasc);
create index ix_func2 on funcionario(cidade,pais);


-- ALTER:


-- DROP:


-- TRUNCATE:
