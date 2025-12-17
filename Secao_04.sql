/* Operadores Lógicos: */

-- Operador where:
select * from senso
where nome_mun = 'Jundiaí';

select * from senso
where nome_mun = 'garanhuns';


-- Operador and:
select * from senso
where cod_uf = '35'
and populacao > 50000
and ano = '2014';


-- Operador between:
select * from senso
where cod_uf = '26'
and populacao between 90000 and 140000
and ano = '2014'
order by populacao desc;


-- Operador in:
select * from senso
where cod_uf in ('35','12')
and ano = '2014';


-- Operador not in:
select * from senso
where cod_uf not in ('35','12')
and ano = '2014';


-- Operador like: Contém 'or' em qualquer lugar.
select * from senso
where nome_mun like ('%or%')
and ano = 2014;

	-- Contém 'r' na segunda posição:
	select * from senso
	where nome_mun like ('_r%')
	and ano = 2014;

	-- Inicia com 'a' e possue pelo menos 3 caracteres de comprimento:
	select * from senso
	where nome_mun like ('a_%_%_%_%')
	and ano = '2014';

	-- Inicia com 'a' e termina com 'o':
	select * from senso
	where nome_mun like ('a%o')
	and ano = '2014';

	-- Inicia com 'a' e termina com qualquer caractere:
	select * from senso
	where nome_mun like ('a%')
	and ano = '2014';

	-- Inicia com qualquer caractere, sendo o segundo caractere 'r' e o terceiro 'a' e termine com qualquer caractere:
	select * from senso
	where nome_mun like ('_ra%')
	and ano = '2014';


-- Operador not:
select ano, cod_uf, estado, nome_mun, populacao from senso
where nome_mun not like ('A%')
and cod_uf = '35'
and not populacao < 40000
and ano = '2014';


-- Operador or:
select * from senso
where nome_mun like ('A%')
and (cod_uf = '26' or cod_uf = '27');


-- Operador is not null:
select * from senso
where regiao is not null;


-- Operador is null:
select * from senso
where regiao is null;

	-- Preparando senáiro para is null:
	select * from senso
	where regiao = '';

	update senso set regiao = null
	where regiao = ''
	and cod_uf = '26'
	and ano = '2014';

	update senso set regiao = ''
	where cod_uf = '26';


-- Operador having:
select Estado, 
	   count(*) as Municípios
from senso
where ano = '2014'
group by estado
having count(cod_mun) > 500;