use mydb;

select *from Cliente;

select *from Contato;

select *from Motorista;

select nm_pessoa, nr_cpf, features from Pessoa p
	inner join Motorista  m on (m.idPessoa = p.idPessoa )
	inner join Feature_driver fd on (fd.idMotorista = m.idMotorista);
    

select *from Feature_driver;
    
insert into Feature_driver (features, idMotorista) values ('Portugues e Ingles', 2);

select *from Local;

insert into Local (rua, complemento, cep) values ('rua 10', 'prox ao colegio Estadual', '68070-560');

select *from Chamado;

insert into Chamado (dt_chamado, valor, idCliente, idLocal, idMotorista) values ('2016-05-05 12:50:30', 57.80, 1, 1, 2);

select *from Carros;

insert into Carros (placa, idMotorista, modelo, cor, ano) values ('NXJ-9173', 2, 'Skyline GTI', 'azul', '2010');

select nm_cliente, nr_cpf, email from Cliente cli
	inner join Contato c on (c.idCliente = cli.id)
    inner join Motorista mt on (mt.id = c.idMotorista);
    
    

select nm_cliente,  dt_chamado, rua, complemento, cep, nm_motorista, modelo, placa, cor, ano from Chamado ch
	inner join Cliente cli on (cli.id = ch.idCliente)
    inner join Motorista mt on (mt.id = ch.idMotorista)
    inner join Local loc on (loc.id = ch.idLocal)
    inner join Carros car on (car.idMotorista = mt.id);    