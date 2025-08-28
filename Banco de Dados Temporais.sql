create database temporal;

create table inventorioCarros
(
	id integer primary key identity,
	ano integer,
	marca varchar(40),
	modelo varchar(40),
	cor varchar(12),
	kilometragem integer,
	emEstoque bit not null default 1,
	SysStartTime datetime2 generated always as row start not null,
	SysEndTime datetime2 generated always as row end not null,
	period for system_time (SysStartTime, SysEndTime)
	)
	with
	(
		SYSTEM_VERSIONING = ON
	)


	insert into inventorioCarros (ano, marca, modelo, cor, kilometragem)
	values (2020, 'GM', 'Corvette', 'Amarelo', 5559);
	
	insert into inventorioCarros (ano, marca, modelo, cor, kilometragem)
	values (1986, 'Shelby', 'Cobra', 'Azul', 75559);
	
	insert into inventorioCarros (ano, marca, modelo, cor, kilometragem)
	values (2012, 'Ford', 'Ka', 'Amarelo', 34256);
	
	insert into inventorioCarros (ano, marca, modelo, cor, kilometragem)
	values (2004, 'Fiat', 'Uno com escada', 'Branco', 98878);
	select * from inventorioCarros

	update inventorioCarros set kilometragem = 37333 where id = 3

	delete from inventorioCarros where id = 1
	select * from inventorioCarros
	for system_time all
	where id = 3


	drop table inventorioCarros;


	alter table inventorioCarros
	set (system_versioning = off)
	
	drop table inventorioCarros;

	
create table inventorioCarros
(
	id integer primary key identity,
	ano integer,
	marca varchar(40),
	modelo varchar(40),
	cor varchar(12),
	kilometragem integer,
	emEstoque bit not null default 1,
	SysStartTime datetime2 generated always as row start not null,
	SysEndTime datetime2 generated always as row end not null,
	period for system_time (SysStartTime, SysEndTime)
	)
	with
	(
		SYSTEM_VERSIONING = ON 
		(history_table = dbo.HistoricoInventorioCarros)
	)

	
	insert into inventorioCarros (ano, marca, modelo, cor, kilometragem)
	values (2020, 'GM', 'Corvette', 'Amarelo', 5559);
	
	insert into inventorioCarros (ano, marca, modelo, cor, kilometragem)
	values (1986, 'Shelby', 'Cobra', 'Azul', 75559);
	
	insert into inventorioCarros (ano, marca, modelo, cor, kilometragem)
	values (2012, 'Ford', 'Ka', 'Amarelo', 34256);
	
	insert into inventorioCarros (ano, marca, modelo, cor, kilometragem)
	values (2004, 'Fiat', 'Uno com escada', 'Branco', 98878);
	
	
	update inventorioCarros set kilometragem = 37333 where id = 3

	delete from inventorioCarros where id = 1
	select * from inventorioCarros
	for system_time all
	where id = 3

	select * from inventorioCarros
	select * from dbo.HistoricoinventorioCarros

