/*
	- A linguagem SQL é dividida em quatro tipos de instrução de linguagem primárias: DML, DDL, DCL e TCL.
    
        -- DCL (Data Control Languagem):
			grant - Atribui privilégios de acesso a objetos, do banco de dados, aos usuários.
            revoke - Remove os privilégios de acesso a objetos, do banco de dados, aos usuários.
            
*/


show databases;
show tables;

use curso;


-- Criando usuário por linha de comando:
create user 'aluno'@'localhost' identified by 'aluno123';

    -- Recarrega os privilégios para que as mudanças tenham efeito imediato:
    flush privileges;


/* Comandos DCL: São usadas para definir acesso/controle dos dados/objetos. */

-- GRANT:
grant select on curso.funcionarios to 'aluno'@'localhost';


-- REVOKE:



/* Comandos para testar as permições do usuário: */
mysql -u aluno -p

select user();
select current_user();

select * from funcionarios;