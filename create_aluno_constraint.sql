CREATE TABLE Aluno3 (
    nr_rgm NUMBER(8),
    nm_nome VARCHAR2(40),
    nm_pai VARCHAR2(40),
    nm_mae VARCHAR2(40),
    dt_nascimento DATE,
    id_sexo CHAR(1),
    CONSTRAINT aluno3_nr_rgm_pk PRIMARY KEY (nr_rgm),
    CONSTRAINT aluno3_nm_nome_ck CHECK (nm_nome IS NOT NULL),
    CONSTRAINT aluno3_nm_pai_ck CHECK (nm_pai IS NOT NULL),
    CONSTRAINT aluno3_dt_nascimento_ck CHECK (dt_nascimento IS NOT NULL),
    CONSTRAINT aluno3_id_sexo_ck CHECK (id_sexo IN ('M', 'F'))
);

CREATE TABLE Escola3 (
    cd_escola NUMBER(6),
    nm_escola VARCHAR2(50),
    ds_endereco VARCHAR2(50),
    ds_bairro VARCHAR2(40),
    CONSTRAINT escola3_cd_escola_pk PRIMARY KEY (cd_escola),
    CONSTRAINT escola3_nm_escola_ck CHECK (nm_escola IS NOT NULL),
    CONSTRAINT escola3_ds_endereco_ck CHECK (ds_endereco IS NOT NULL),
    CONSTRAINT escola3_ds_bairro_ck CHECK (ds_bairro IS NOT NULL)
);

CREATE TABLE Grau3 (
    cd_grau NUMBER(2),
    nm_grau VARCHAR2(50),
    CONSTRAINT grau3_cd_grau_pk PRIMARY KEY (cd_grau),
    CONSTRAINT grau3_nm_grau_ck CHECK (nm_grau IS NOT NULL)
);

CREATE TABLE Periodo3 (
    cd_periodo NUMBER(2),
    nm_periodo VARCHAR2(50),
    CONSTRAINT periodo3_cd_periodo_pk PRIMARY KEY (cd_periodo),
    CONSTRAINT periodo3_nm_periodo_ck CHECK (nm_periodo IS NOT NULL)
);

CREATE TABLE Classe3 (
    cd_classe NUMBER(8),
    nr_anoletivo NUMBER(4),
    cd_escola NUMBER(6),
    cd_grau NUMBER(2),
    nr_serie NUMBER(2),
    sg_turma VARCHAR2(2),
    cd_periodo NUMBER(2),
    CONSTRAINT classe3_cd_classe_pk PRIMARY KEY (cd_classe),
    CONSTRAINT classe3_nr_anoletivo_ck CHECK (nr_anoletivo IS NOT NULL AND nr_anoletivo > 2000),
    CONSTRAINT classe3_cd_escola_fk FOREIGN KEY (cd_escola) REFERENCES Escola3(cd_escola),
    CONSTRAINT classe3_cd_grau_fk FOREIGN KEY (cd_grau) REFERENCES Grau3(cd_grau),
    CONSTRAINT classe3_sg_turma_ck CHECK (sg_turma IS NOT NULL),
    CONSTRAINT classe3_cd_periodo_fk FOREIGN KEY (cd_periodo) REFERENCES Periodo3(cd_periodo)
);

CREATE TABLE Matricula3 (
    cd_classe NUMBER(8),
    nr_rgm NUMBER(8),
    dt_matricula DATE,
    CONSTRAINT matricula3_cd_classe_fk FOREIGN KEY (cd_classe) REFERENCES Classe3(cd_classe),
    CONSTRAINT matricula3_nr_rgm_fk FOREIGN KEY (nr_rgm) REFERENCES Aluno3(nr_rgm),
    CONSTRAINT matricula3_dt_matricula_ck CHECK (dt_matricula IS NOT NULL)
);
