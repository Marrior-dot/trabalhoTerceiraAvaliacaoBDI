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