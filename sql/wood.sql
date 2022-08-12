-- criar banco de dados
create database wood;

-- selecionar banco de dados
use wood;

CREATE TABLE cliente (
    codCliente INT NOT NULL auto_increment,
    nomeCliente VARCHAR(50),
    cpfCliente VARCHAR(11),
    enderecoCliente VARCHAR(200),
    emailCliente VARCHAR(60),
    telCliente VARCHAR(9),
    dataNasc DATE,
    PRIMARY KEY (codCliente)
);

CREATE TABLE movel (
    codMovel INT NOT NULL auto_increment,
    categoriaMovel VARCHAR(20),
    corMovel VARCHAR(20),
    materialMovel VARCHAR(60),
    compMovel DOUBLE,
    larguraMovel DOUBLE,
    quantDisponivel INT,
    precoMovel DOUBLE

    PRIMARY KEY (codMovel)
);

CREATE TABLE pagamento (
    codPagamento INT NOT NULL auto_increment,
    formaPagamento VARCHAR(60),
    Pagamento_TIPO VARCHAR(60)

    PRIMARY KEY (codPagamento)
);

CREATE TABLE avaliacao (
    codAvaliar INT NOT NULL auto_increment,
    dataAvaliar DATE,
    sugestao VARCHAR(200),

    KEY fk_Cliente_codCliente (cod_cliente),
    PRIMARY KEY (codAvaliar)
);

CREATE TABLE duvida (
    codDuvida INT NOT NULL auto_increment,
    duvida VARCHAR(200),
    dataDuvida DATE,

    fk_Cliente_codCliente INT,
    fk_Assistente_cod_adm INT,
    PRIMARY KEY (codDuvida)
);

CREATE TABLE personaliza (
    cod_personalizacao INT NOT NULL auto_increment,
    data DATE,

    fk_Movel_codMovel INT,
    fk_Cliente_codCliente INT,
    PRIMARY KEY (cod_personalizacao)
);

CREATE TABLE partes (
    codParte INT NOT NULL auto_increment,
    nomeParte VARCHAR(60),
    descricaoParte VARCHAR(200),

    fk_Movel_codMovel INT,
    PRIMARY KEY (codParte)
);

CREATE TABLE material (
    codMaterial INT NOT NULL auto_increment,
    acrescPreco DOUBLE,
    nomeMaterial VARCHAR(60),
    descricaoMaterial VARCHAR(200),

    PRIMARY KEY (codMaterial)
);

CREATE TABLE assistente (
    cod_adm INT NOT NULL auto_increment,
    nome_adm VARCHAR(60),
    email_adm VARCHAR(60),
    cpf_adm VARCHAR(11),

    PRIMARY KEY (cod_adm)
);

CREATE TABLE encomenda (
    fk__Personaliza_cod_personalizacao INT,
    fk_Cliente_codCliente INT
);

CREATE TABLE realiza (
    fk_Cliente_codCliente INT,
    fk_Pagamento_codPagamento INT
);

CREATE TABLE personalizacao (
    fk_Material_codMaterial INT,
    cor VARCHAR(60)
);
 
ALTER TABLE avaliacao ADD CONSTRAINT FK_Avaliacao_2
    FOREIGN KEY (fk_Cliente_codCliente)
    REFERENCES cliente (codCliente)
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
    FOREIGN KEY (fk__Personaliza_cod_personalizacao)
    REFERENCES personaliza (cod_personalizacao)
    ON DELETE SET NULL;
 
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