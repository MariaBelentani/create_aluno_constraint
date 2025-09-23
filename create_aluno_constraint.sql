create table Aluno2 (
    nr_rgm number(8),
    nm_nome varchar2(40),
    nm_pai varchar2(40),
    nm_mae varchar2(40),
    dt_nascimento date,
    id_sexo char(1),
    constraint aluno2_nr_rgm_pk primary key (nr_rgm),
    constraint aluno2_nm_nome_ck check (nm_nome is not null),
    constraint aluno2_nm_pai_ck check (nm_pai is not null),
    constraint aluno2_dt_nascimento_ck check (dt_nascimento is not null),
    constraint aluno2_id_sexo_ck check (id_sexo in ('M', 'F'))
);



create table Escola2 (
    cd_escola number(6),
    nm_escola varchar2(50),
    ds_endereco varchar2(50),
    ds_bairro varchar2(40),
    constraint escola2_cd_escola_pk primary key (cd_escola),
    constraint escola2_nm_escola_ck check (nm_escola is not null),
    constraint escola2_ds_endereco_ck check (ds_endereco is not null),
    constraint escola2_ds_bairro_ck check (ds_bairro is not null)
);


create table Matricula2 (
    cd_classe number(8),
    nr_grm number(8),
    dt_matricula date,
    constraint matricula2_cd_classe_fk foreign key (cd_classe) references Classe2(cd_classe),
    constraint matricula2_nr_rgm_fk foreign key (nr_rgm) references Aluno2(nr_rgm),
    constraint matricula2_dt_matricula_ck check (dt_matricula is not null)
);



create table Grau2 (
    cd_grau number(2),
    nm_grau varchar2(50),
    constraint grau2_cd_grau_pk primary key (cd_grau),
    constraint grau2_nm_grau_ck check (nm_grau is not null)
);



create table Periodo2 (
    cd_periodo number(2),
    nm_periodo varchar2(50),
    constraint periodo2_cd_periodo_pk primary key (cd_periodo),
    constraint periodo2_nm_periodo_ck check (nm_periodo is not null)
);



create table Classe2 (
    cd_classe number(8),
    nr_anoletivo number(4),
    cd_escola number(6),
    cd_grau number(2),
    nr_serie number(2),
    sg_turma varchar2(2),
    cd_periodo number(2),
    constraint classe2_cd_classe_pk primary key (cd_classe),
    constraint classe2_nr_anoletivo_ck check (nr_anoletivo is not null AND nr_anoletivo > 2000),
    constraint classe2_cd_escola_fk foreign key (cd_escola) references Escola(cd_escola),
    constraint classe2_cd_grau_fk foreign key (cd_grau) references Grau(cd_grau),
    constraint classe2_sg_turma_ck check (sg_turma is not null),
    constraint classe2_cd_periodo_fk foreign key (cd_periodo) references Periodo(cd_periodo)
);