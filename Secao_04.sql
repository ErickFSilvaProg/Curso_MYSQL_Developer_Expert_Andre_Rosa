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
where cod_uf = '35'
and populacao between 5000 and 10000
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