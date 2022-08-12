create database projetowood;

use projetowood;

create table rascunho
(
	id_rascunho	int not null auto_increment,
    nome_movel		varchar(50)	not null,
    foto_blob       blob,
    primary key (id_rascunho)

);