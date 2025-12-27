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
grant select(nome,setor) on curso.funcionarios to 'aluno'@'localhost';

grant update on curso.funcionarios to 'aluno'@'localhost';
grant update on *.* to 'aluno'@'localhost';

grant delete on curso.funcionarios to 'aluno'@'localhost';
grant delete on *.* to 'aluno'@'localhost';

grant insert on curso.funcionarios to 'aluno'@'localhost';

grant create routine on teste.* to 'aluno'@'localhost';
grant alter routine on teste.* to 'aluno'@'localhost';
grant execute on procedure teste.proc_quadrado to 'aluno'@'localhost';

grant all privileges on funcionarios to 'aluno'@'localhost';
grant all privileges on *.* to 'aluno'@'localhost';

flush privileges;


-- REVOKE:
revoke select on curso.funcionarios to 'aluno'@'localhost';


/* Comandos para testar as permições do usuário: */
mysql -u aluno -p

select user();
select current_user();

use curso;

-- Passos para verificar permissões:
/* 

1. Para um usuário específico (ex: aluno em localhost):
    SHOW GRANTS FOR 'aluno'@'localhost';

2. Para ver as permissões do usuário atual:
    SHOW GRANTS;

3. Para ver permissões de um usuário em qualquer host:
    SELECT CONCAT('SHOW GRANTS FOR \'', user, '\'@\'', host, '\';') FROM mysql.user WHERE user = 'aluno';

*/

select * from mysql.user where user = 'aluno';