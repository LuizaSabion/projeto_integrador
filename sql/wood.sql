-- drop database wood;

-- criar banco de dados
create database wood;

-- selecionar banco de dados
use wood;


CREATE TABLE cliente (
    codCliente 				INT NOT NULL auto_increment,
    nomeCliente 			VARCHAR(100),
    dataNasc 				DATE,
    cpfCliente 				VARCHAR(15),
    telCliente 				VARCHAR(25),
    emailCliente 			VARCHAR(100),
    estadoCliente           VARCHAR(100),
    cepCliente				VARCHAR(25),
    cidadeCliente			VARCHAR(100),
    bairroCliente			VARCHAR(100),
    ruaCliente				VARCHAR(100),
    numCasaCliente			VARCHAR(10),
    foto_blob blob,
    foto_nome varchar(100),

    PRIMARY KEY (codCliente)
);

CREATE TABLE movel (
    codMovel 				INT NOT NULL auto_increment,
    categoriaMovel 			VARCHAR(20),
    corMovel 				VARCHAR(20),
    materialMovel			VARCHAR(60),
    compMovel 				DOUBLE,
    larguraMovel 			DOUBLE,
    quantDisponivel 		INT,
    precoMovel 				DOUBLE,

    PRIMARY KEY (codMovel)
);

CREATE TABLE pagamento (
    codPagamento 			INT NOT NULL auto_increment,
    formaPagamento 			VARCHAR(60),
    Pagamento_TIPO 			VARCHAR(60),

    PRIMARY KEY (codPagamento)
);

CREATE TABLE avaliacao (
    codAvaliar 				INT NOT NULL auto_increment,
    estrela
    dataAvaliar 			DATE,
    observacao				VARCHAR(300),
    fk_Cliente_codCliente	INT NOT NULL,
	
    PRIMARY KEY (codAvaliar),
    FOREIGN KEY (fk_Cliente_codCliente) REFERENCES cliente(codCliente) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE assistente (
    cod_adm 				INT NOT NULL auto_increment,
    nome_adm 				VARCHAR(60),
    email_adm 				VARCHAR(60),
    cpf_adm 				VARCHAR(11),

    PRIMARY KEY (cod_adm)
);

CREATE TABLE duvida (
    codDuvida 				INT NOT NULL auto_increment,
    duvida 					VARCHAR(200),
    dataDuvida 				DATE,
    fk_Cliente_codCliente 	int not null,
    fk_Assistente_cod_adm 	int not null,
    
    PRIMARY KEY (codDuvida),
    FOREIGN KEY (fk_Cliente_codCliente) REFERENCES cliente(codCliente) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(fk_Assistente_cod_adm) REFERENCES assistente(cod_adm) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE personaliza (
    cod_personalizacao 		INT NOT NULL auto_increment,
    data 					DATE,
    fk_Movel_codMovel 		INT not null,
    fk_Cliente_codCliente 	INT not null,
    
    PRIMARY KEY (cod_personalizacao),
    FOREIGN KEY (fk_Cliente_codCliente) REFERENCES cliente(codCliente) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_Movel_codMovel) REFERENCES movel(codMovel) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE partes (
    codParte 				INT NOT NULL auto_increment,
    nomeParte 				VARCHAR(60),
    descricaoParte 			VARCHAR(200),
    fk_Movel_codMovel 		INT not null,
    
    PRIMARY KEY (codParte),
    FOREIGN KEY (fk_Movel_codMovel) REFERENCES movel(codMovel) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE material (
    codMaterial 			INT NOT NULL auto_increment,
    acrescPreco 			DOUBLE,
    nomeMaterial 			VARCHAR(60),
    descricaoMaterial 		VARCHAR(200),
    PRIMARY KEY (codMaterial)
);

CREATE TABLE personalizacao (
    cor 						VARCHAR(60),
    fk_Material_codMaterial 	INT not null,
    
    PRIMARY KEY (fk_Material_codMaterial),
    FOREIGN KEY (fk_Material_codMaterial) REFERENCES material(codMaterial) ON DELETE CASCADE ON UPDATE CASCADE  
);

CREATE TABLE encomenda (
    fk__Personaliza_cod_personalizacao 	INT not null,
    fk_Cliente_codCliente 				INT not null,
    
    PRIMARY KEY (fk_Cliente_codCliente,fk__Personaliza_cod_personalizacao),
    FOREIGN KEY (fk_Cliente_codCliente) REFERENCES cliente(codCliente) ON DELETE CASCADE ON UPDATE CASCADE, 
    FOREIGN KEY (fk__Personaliza_cod_personalizacao) REFERENCES personalizacao(fk_Material_codMaterial) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE realiza (
    fk_Cliente_codCliente 			INT not null,
    fk_Pagamento_codPagamento 		INT not null,
    
    PRIMARY KEY (fk_Cliente_codCliente,fk_Pagamento_codPagamento),
    FOREIGN KEY (fk_Cliente_codCliente) REFERENCES cliente(codCliente) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_Pagamento_codPagamento) REFERENCES pagamento(codPagamento) ON DELETE CASCADE ON UPDATE CASCADE
);


 
ALTER TABLE avaliacao ADD CONSTRAINT FK_Avaliacao_2
    FOREIGN KEY (fk_Cliente_codCliente)
    REFERENCES cliente(codCliente)
    ON DELETE CASCADE;
 
ALTER TABLE duvida ADD CONSTRAINT FK_Duvida_2
    FOREIGN KEY (fk_Cliente_codCliente)
    REFERENCES cliente (codCliente)
    ON DELETE CASCADE;
 
ALTER TABLE duvida ADD CONSTRAINT FK_Duvida_3
    FOREIGN KEY (fk_Assistente_cod_adm)
    REFERENCES assistente (cod_adm)
    ON DELETE SET NULL;
 
ALTER TABLE personaliza ADD CONSTRAINT FK__Personaliza_2
    FOREIGN KEY (fk_Movel_codMovel)
    REFERENCES movel (codMovel);
 
ALTER TABLE personaliza ADD CONSTRAINT FK__Personaliza_3
    FOREIGN KEY (fk_Cliente_codCliente)
    REFERENCES cliente (codCliente);
 
ALTER TABLE partes ADD CONSTRAINT FK__Partes_2
    FOREIGN KEY (fk_Movel_codMovel)
    REFERENCES movel (codMovel);
 
ALTER TABLE encomenda ADD CONSTRAINT FK_Encomenda_1
    FOREIGN KEY (fk__Personaliza_cod_personalizacao) REFERENCES personaliza (cod_personalizacao) ON DELETE SET NULL;
 
ALTER TABLE encomenda ADD CONSTRAINT FK_Encomenda_2
    FOREIGN KEY (fk_Cliente_codCliente)
    REFERENCES cliente (codCliente)
    ON DELETE SET NULL;
 
ALTER TABLE realiza ADD CONSTRAINT FK_Realiza_1
    FOREIGN KEY (fk_Cliente_codCliente)
    REFERENCES cliente (codCliente)
    ON DELETE RESTRICT;
 
ALTER TABLE realiza ADD CONSTRAINT FK_Realiza_2
    FOREIGN KEY (fk_Pagamento_codPagamento)
    REFERENCES pagamento (codPagamento)
    ON DELETE SET NULL;
 
ALTER TABLE personalizacao ADD CONSTRAINT FK_Personalizacao_1
    FOREIGN KEY (fk_Material_codMaterial)
    REFERENCES material (codMaterial)
    ON DELETE SET NULL;
