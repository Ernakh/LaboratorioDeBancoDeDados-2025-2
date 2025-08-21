select * from java

create table pessoas
(
	id integer primary key identity,
	nome varchar(50) not null,
	nome_pet varchar(30) null,
	num_pet integer check(num_pet > 0),
	idade integer check(idade between 18 and 99),
	sexo char check (sexo in ('M', 'F', 'N')),
	nacionalidade varchar(50) default 'Brasieira'
)


select * from java

create table log
(
	id integer not null primary key identity,
	acao varchar(10) not null,
	descricao varchar(100),
	quando datetime not null
)

create trigger primeiratrigger
on java
after delete 
as 
begin
	insert into log values ('exclusão', 
		'foi excluido um professor de java', GETDATE());
end

DELETE FROM JAVA WHERE PROFESSOR = 'Helder'
SELECT * FROM java
SELECT * FROM LOG

create trigger segundatrigger
on java
after insert 
as 
begin
	insert into log values ('inserção', 
		'foi incluido um novo professor em java', getdate());
	PRINT('Dados inseridos com sucesso!');
end

insert into java values ('Helder')
drop trigger segundatrigger


create trigger terceiratrigger
on java
after insert
as begin
	declare @contagem int
	select @contagem = (select count(professor) from java)

	print('Quantidade de registros: ' + CONVERT(VARCHAR(10), @contagem))

	IF @contagem <3
		begin
			insert into log values ('Inserção', 'Novo professor em Java!',
					getdate());
			print('Professor inserido com sucesso!');
		end
	else
		begin
			ROLLBACK;
			insert into log values ('Inserção', 
				'Tentativa de inserção feita sem vagas disponíveis',
				getdate());
			RAISERROR('INVALIDO', 14 , 1);
		End
end

create trigger quartatrigger
on java
after update
as 
begin
	declare @old varchar(10)
	declare @new varchar(10)

	select @old = (select deleted.professor from deleted)
	select @new = (select inserted.professor from inserted)

	IF(ROWCOUNT_BIG() = 0)
		return;

	IF @old = @new 
		begin
			raiserror('Sem alterações, valroes iguais', 14,1);
			rollback transaction;
			insert into log values ('Alteração', 
				'Tentativa de alteração não executada', getdate());
		end
	else
		begin
			insert into log values ('Alteração', 
				'Alteração do nome do professor ' + @old + ' para o nome '
				+ @new, GETDATE());
		end
end




create table pessoa
(
	id integer primary key identity,
	nome varchar(50) not null,
	idade integer not null,
	maioridade varchar(3)
)

create trigger pessoatrigger
on pessoa
after insert 
as 
begin
	declare @idade integer
	select @idade = (select inserted.idade from inserted)

	if @idade > 17
		begin
			update pessoa set maioridade = 'sim' 
			where pessoa.id = (select inserted.id from inserted 
								join pessoa
								on inserted.id = pessoa.id)
		end
		else
			begin
				update pessoa set maioridade = 'não' 
			where pessoa.id = (select inserted.id from inserted 
								join pessoa
								on inserted.id = pessoa.id)
			end
end





