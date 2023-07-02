CREATE TABLE Arquiteto(
    Id_Arquiteto NUMBER(8),
    Data_Nasc DATE,
    Nome VARCHAR(25),
    CONSTRAINT Pk_Arquiteto PRIMARY KEY(Id_Arquiteto)
);

CREATE TABLE Obra(
    Registro_Imovel NUMBER(10),
    Prazo DATE,
    Custo NUMBER(10),
    Area_Ocupada NUMBER(5),

)

CREATE TABLE Pedreiro(
    CEP_Endereco VARCHAR(8),
    Cidade_Endereco VARCHAR(20),
    Estado_Endereco VARCHAR(15),
    Nome VARCHAR(25) NOT NULL,
    Idade NUMBER(2) NOT NULL,  /* Data Nasc(?) */
    Registro_Imovel NUMBER(15),
    Id_Empreiteira NUMBER(5),
    Id_Gerente NUMBER(5),
    CPF VARCHAR(12),
    CONSTRAINT Pk_Pedreiro PRIMARY KEY (CPF, Id_Gerente)
)

ALTER TABLE Pedreiro ADD CONSTRAINT FOREIGN KEY Id_Gerente REFERENCES GerenteDeObras(Id_Gerente)


CREATE TABLE GerenteDeObras(
    Data_Admissao DATE,
    Nome VARCHAR(25),
    Idade NUMBER(2),
    Registro_Imovel VARCHAR(15),
    Id_Empreiteira 
)

CREATE TABLE engenheiro (
  nome varchar not null,
  dia_nascimento int not null,
  ano_nascimento int not null,
  id_projeto varchar not null,
  registro_imovel varchar not null,
  numero_CREA varchar,
  CONSTRAINT PRIMARY KEY (numero_CREA)
);

ALTER TABLE Engenheiro ADD FOREIGN KEY Fk_Engenheiro_Projeto (id_projeto) REFERENCES     Projeto(id_projeto)


CREATE TABLE Pedreiro(
    CEP_Endereco VARCHAR(8),
    Cidade_Endereco VARCHAR(20),
    Estado_Endereco VARCHAR(15),
    Nome VARCHAR(25) NOT NULL,
    Idade NUMBER(2) NOT NULL,  /* Data Nasc(?) */
    Registro_Imovel NUMBER(15),
    Id_Empreiteira NUMBER(5),
    Id_Gerente NUMBER(5),
    CPF VARCHAR(12),
    CONSTRAINT Pk_Pedreiro PRIMARY KEY (CPF, Id_Gerente)
)

ALTER TABLE Pedreiro ADD CONSTRAINT FOREIGN KEY Id_Gerente REFERENCES GerenteDeObras(Id_Gerente)


CREATE TABLE GerenteDeObras(
    Data_Admissao DATE,
    Nome VARCHAR(25),
    Idade NUMBER(2),
    Registro_Imovel VARCHAR(15),
    Id_Empreiteira NUMBER(5),
    Id_Gerente NUMBER(5),
    CPF VARCHAR(11),
    CONSTRAINT Pk_Gerente PRIMARY KEY (CPF, Id_Gerente)
)



CREATE TABLE obra (
  dia_inicio int,
  mes_inicio int,
  ano_inicio int,
  dia_previsão_termino int,
  mes_previsão_termino int,
  ano_previsão_termino int,
  dia_termino int,
  mes_termino int,
  ano_termino int,
  custo float,
  prazo date,
  area_ocupada float,
  Numero_CREA varchar,
  id_gerente varchar,
  CPF_gerente varchar,
  id_pedreiro varchar,
  id_empreteira varchar,
  numero_local int,
  registro_imovel varchar,
  CONSTRAINT fk_numero_CREA FOREIGN KEY (Numero_CREA) REFERENCES Engenheiro(numero_CREA),
  CONSTRAINT fk_id_gerente FOREIGN KEY (id_gerente) REFERENCES Gerente(id_gerente),
  CONSTRAINT fk_CPF_gerente FOREIGN KEY (CPF_gerente) REFERENCES Gerente(CPF),
  CONSTRAINT fk_id_pedreiro FOREIGN KEY (id_pedreiro) REFERENCES Pedreiro(id_pedreiro),
  CONSTRAINT fk_id_empreteira FOREIGN KEY (id_empreteira) REFERENCES Empreteira(id_empreteira),
  CONSTRAINT fk_numero_local FOREIGN KEY (numero_local) REFERENCES Local(numero_local),
  CONSTRAINT fk_registro_imovel FOREIGN KEY (registro_imovel) REFERENCES Imovel(registro_imovel)
);


CREATE TABLE projeto (
  dia_inicio NUMBER(2),
  mes_inicio NUMBER(2),
  ano_inicio NUMBER(2),
  dia_previsão_termino NUMBER(2),
  mes_previsão_termino NUMBER(2),
  ano_previsão_termino NUMBER(2),
  dia_termino NUMBER(2),
  mes_termino NUMBER(2),
  ano_termino NUMBER(2),
  custo NUMBER(8,2),
  prazo date,
  area_ocupada NUMBER(8,2),
  Numero_CREA varchar,
  id_gerente varchar,
  CPF_gerente varchar,
  id_pedreiro varchar,
  id_empreteira varchar,
  numero_local NUMBER(2),
  registro_imovel varchar,
  CONSTRAINT fk_numero_CREA FOREIGN KEY (Numero_CREA) REFERENCES Engenheiro(numero_CREA),
  CONSTRAINT fk_id_gerente FOREIGN KEY (id_gerente) REFERENCES Gerente(id_gerente),
  CONSTRAINT fk_CPF_gerente FOREIGN KEY (CPF_gerente) REFERENCES Gerente(CPF),
  CONSTRAINT fk_id_pedreiro FOREIGN KEY (id_pedreiro) REFERENCES Pedreiro(id_pedreiro),
  CONSTRAINT fk_id_empreteira FOREIGN KEY (id_empreteira) REFERENCES Empreteira(id_empreteira),
  CONSTRAINT fk_numero_local FOREIGN KEY (numero_local) REFERENCES Local(numero_local),
  CONSTRAINT fk_registro_imovel FOREIGN KEY (registro_imovel) REFERENCES Imovel(registro_imovel)
);


CREATE TABLE empresa_contratante (
  id_projeto varchar,
  numero_local varchar,
  id_empreiteira varchar,
  id_empresa varchar,
  CONSTRAINT fk_id_projeto FOREIGN KEY (id_projeto) REFERENCES projeto(numero_CREA),
  CONSTRAINT fk_numero_local FOREIGN KEY (numero_local) REFERENCES local(numero_local),
  CONSTRAINT fk_id_empreiteira FOREIGN KEY (id_empreiteira) REFERENCES empreiteira(id_empreiteira),
  CONSTRAINT fk_id_empresa FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa)
);
