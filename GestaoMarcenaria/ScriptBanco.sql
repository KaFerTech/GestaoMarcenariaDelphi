--Banco de dados Marcenaria_Do_Catarina

CREATE TABLE USUARIO
(
  COD integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
  NOME varchar(80) NOT NULL,
  LOGIN varchar(30) NOT NULL,
  TELEFONE varchar(50) NOT NULL,
  EMAIL varchar(90) DEFAULT NULL,
  CODPERFIL integer NOT NULL,
  SIT char(1) NOT NULL,
  DATCAD date NOT NULL,
  DATINAT date DEFAULT NULL,
  SENHA varchar(30) NOT NULL
);


CREATE TABLE PERFIL
(
  COD integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
  DESCRICAO varchar(50)
);


ALTER TABLE USUARIO ADD CONSTRAINT FK_USUARIO_PERFIL
FOREIGN KEY (CODPERFIL) REFERENCES PERFIL (COD);

INSERT INTO PERFIL (descricao) values ('Administrador');
INSERT INTO PERFIL (descricao) values ('Usuario');
INSERT INTO PERFIL (descricao) values ('Consulta');


CREATE TABLE FUNCIONARIO
(
  COD integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,  
  CPF varchar(14) NOT NULL,
  NOME varchar(80) NOT NULL,
  DATNASC date DEFAULT NULL,
  GENERO char(1) NOT NULL,
  NACION varchar(30) NOT NULL,
  TIPFUNC char(1) DEFAULT NULL,
  CARGO varchar(50) NOT NULL,
  DEPART varchar(50) NOT NULL,
  SIT char(1) NOT NULL,
  DATCAD date NOT NULL,
  DATINAT date DEFAULT NULL,
  TELEFONE varchar(50) NOT NULL,
  CEP varchar(10) NOT NULL,
  UF char(2) NOT NULL,
  CIDADE varchar(70) NOT NULL,
  BAIRRO varchar(70) NOT NULL,
  TIPOLOGRADOURO varchar(30) NOT NULL,
  LOGRADOURO varchar(70) NOT NULL,
  NUMERO varchar(10) NOT NULL,
  COMPLEMENTO varchar(100) NOT NULL,
  TIPOENDERECO char(1) NOT NULL,
  CODUSUARIO integer DEFAULT NULL
);

ALTER TABLE FUNCIONARIO ADD CONSTRAINT FK_FUNCIONARIO_USUARIO
FOREIGN KEY (CODUSUARIO) REFERENCES USUARIO (COD);


CREATE TABLE CLIENTE
(
  COD integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
  TIPOPESSOA char(2) NOT NULL, --PF, PJ
  CPFCNPJ varchar(18) NOT NULL,
  NOME varchar(80) NOT NULL,
  SIT char(1) NOT NULL,
  DATCAD date NOT NULL,
  DATINAT date DEFAULT NULL,
  TELEFONE varchar(50) NOT NULL,
  CEP varchar(10) NOT NULL,
  UF char(2) NOT NULL,
  CIDADE varchar(70) NOT NULL,
  BAIRRO varchar(70) NOT NULL,
  TIPOLOGRADOURO varchar(30) NOT NULL,
  LOGRADOURO varchar(70) NOT NULL,
  NUMERO varchar(10) NOT NULL,
  COMPLEMENTO varchar(100) NOT NULL,
  TIPOENDERECO char(1) NOT NULL
);


CREATE TABLE FORNECEDOR
(
  COD integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
  CNPJ varchar(18) NOT NULL,
  RAZAOSOCIAL varchar(80) NOT NULL,
  NOMEFANTASIA varchar(80) DEFAULT NULL,
  SIT char(1) NOT NULL,
  DATCAD date NOT NULL,
  DATINAT date DEFAULT NULL,
  TELEFONE varchar(50) NOT NULL,
  CEP varchar(10) NOT NULL,
  UF char(2) NOT NULL,
  CIDADE varchar(70) NOT NULL,
  BAIRRO varchar(70) NOT NULL,
  TIPOLOGRADOURO varchar(30) NOT NULL,
  LOGRADOURO varchar(70) NOT NULL,
  NUMERO varchar(10) NOT NULL,
  COMPLEMENTO varchar(100) DEFAULT NULL,
  TIPOENDERECO char(1) NOT NULL
);


CREATE TABLE GRUPOMATERIAL
(
  COD integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
  SIT char(1) NOT NULL,
  NOME varchar(80) NOT NULL,
  DATCAD date NOT NULL,
  DATINAT date DEFAULT NULL
);


CREATE TABLE MATERIAL
(
  COD integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
  NOME varchar(80) NOT NULL,
  CODGRUPOMATERIAL integer NOT NULL, 
  SIT char(1) NOT NULL,
  DATCAD date NOT NULL,
  DATINAT date DEFAULT NULL,
  UNIDADEMEDIDA char(2) NOT NULL,
  ESTOQUEMIN integer NOT NULL,
  ESTOQUEMAX integer NOT NULL,
  CODEAN varchar(13) DEFAULT NULL,
  OBSERVACAO varchar(100) DEFAULT NULL
);

ALTER TABLE MATERIAL ADD CONSTRAINT FK_MATERIAL_GRUPOMATERIAL
FOREIGN KEY (CODGRUPOMATERIAL) REFERENCES GRUPOMATERIAL (COD);


CREATE TABLE MOVMATERIAL
(
  COD integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
  DATMOV date NOT NULL,
  CODFUNC integer Default NULL,
  OPERACAO Varchar(7) NOT NULL,
  OBSERVACAO varchar(100)
);

CREATE TABLE MOVMATERIALITEM
(
  COD integer GENERATED BY DEFAULT AS IDENTITY NOT NULL,
  CODMAT integer NOT NULL,
  CODMOV integer NOT NULL,
  QTDMAT integer NOT NULL
);

ALTER TABLE MOVMATERIALITEM ADD CONSTRAINT FK_MOVMATERIAL_MATERIAL
FOREIGN KEY (CODMAT) REFERENCES MATERIAL (COD);

ALTER TABLE MOVMATERIALITEM ADD CONSTRAINT FK_MOVMATERIALITEM_MOVIMENTO
FOREIGN KEY (CODMOV) REFERENCES MOVMATERIAL (COD)
ON DELETE CASCADE;





SELECT m.COD, m.NOME AS MATERIAL,  
(COALESCE(entradas.total_entradas, 0) - COALESCE(saidas.total_saidas, 0)) AS QTDESTOQUE,
gm.NOME AS GRUPO
FROM MATERIAL m
LEFT JOIN (
    SELECT mi.CODMAT, SUM(mi.QTDMAT) AS total_entradas
    FROM MOVMATERIALITEM mi
    INNER JOIN MOVMATERIAL mm ON mm.COD = mi.CODMOV AND mm.OPERACAO = 'Entrada'
    GROUP BY mi.CODMAT
) entradas ON entradas.CODMAT = m.COD
LEFT JOIN (
    SELECT mi.CODMAT, SUM(mi.QTDMAT) AS total_saidas
    FROM MOVMATERIALITEM mi
    INNER JOIN MOVMATERIAL mm ON mm.COD = mi.CODMOV AND mm.OPERACAO = 'Saída'
    GROUP BY mi.CODMAT
) saidas ON saidas.CODMAT = m.COD
LEFT JOIN GRUPOMATERIAL gm on gm.COD = m.CODGRUPOMATERIAL
;




