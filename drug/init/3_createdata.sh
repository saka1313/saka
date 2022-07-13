psql -U drug_user -d drugdb << "EOSQL"

CREATE SEQUENCE drug_user.uke_no_seq MAXVALUE 99999999 CYCLE;
CREATE SEQUENCE drug_user.pt_no_seq MAXVALUE 99999999 CYCLE;
CREATE SEQUENCE drug_user.md_no_seq MAXVALUE 99999999 CYCLE;
CREATE SEQUENCE drug_user.hp_no_seq MAXVALUE 99999999 CYCLE;
CREATE SEQUENCE drug_user.dr_no_seq MAXVALUE 99999999 CYCLE;
CREATE SEQUENCE drug_user.ka_no_seq MAXVALUE 99999999 CYCLE;

CREATE TABLE drug_user.pt_tran
(
  uke_no                        integer NOT NULL ,
  receipt_date                  timestamp without time zone ,
  pt_no                         integer ,
  hp_no                         integer ,
  dr_no                         integer ,
  del_flg                       integer ,
  register_user_id              character varying(30)          ,
  register_date                 timestamp without time zone    ,
  update_user_id                character varying(30)          ,
  update_date                   timestamp without time zone    ,
  CONSTRAINT pt_tran_pk PRIMARY KEY (uke_no)
);

CREATE TABLE drug_user.ptset_tran
(
  uke_no                        integer NOT NULL ,
  gyo_no                        integer NOT NULL ,
  md_no                         integer ,
  tb_no                         integer ,
  nomi_no                       integer ,
  times_no                      integer ,
  del_flg                       integer ,
  register_user_id              character varying(30)          ,
  register_date                 timestamp without time zone    ,
  update_user_id                character varying(30)          ,
  update_date                   timestamp without time zone    ,
  CONSTRAINT ptset_tran_pk PRIMARY KEY (uke_no,gyo_no)
);

CREATE TABLE drug_user.pt_master
(
  pt_no                         integer NOT NULL,
  pt_name                       character varying(50)          ,
  birthday_dt                   timestamp without time zone    ,
  insurance_no                  integer                        ,
  insurance_cd                  character varying(50)          ,
  insurance2_cd                 character varying(10)          ,
  fuyo_flg                      integer                        ,
  exp_dt                        timestamp without time zone    ,
  del_flg                       integer DEFAULT 0              ,
  register_user_id              character varying(30)          ,
  register_date                 timestamp without time zone    ,
  update_user_id                character varying(30)          ,
  update_date                   timestamp without time zone    ,
  tel_no                        character varying(13)          ,
  add_no                        character varying(8)          ,
  add1_name                     character varying(32)          ,
  add2_name                     character varying(32)          ,
  add3_name                     character varying(32)          ,
  gender_flg                    integer DEFAULT 0              ,
  CONSTRAINT pt_master_pk PRIMARY KEY (pt_no)
);

CREATE TABLE drug_user.md_master
(
  md_no                         integer NOT NULL ,
  md_name                       character varying(200)         ,
  times_no                      integer                        ,
  tb_no                         integer                        ,
  take_time                     character varying(20)          ,
  dtail                         character varying(200)         ,
  del_flg                       integer DEFAULT 0              ,
  register_user_id              character varying(30)          ,
  register_date                 timestamp without time zone    ,
  update_user_id                character varying(30)          ,
  update_date                   timestamp without time zone    ,
  md_price_k                    integer                        ,
  md_kensaku_flg                character varying(6)          ,
  CONSTRAINT md_master_pk PRIMARY KEY (md_no)
);

CREATE TABLE drug_user.hp_master
(
  hp_no                         integer NOT NULL              ,
  hp_name                       character varying(50)          ,
  hp_add_no                     integer DEFAULT 0              ,
  hp_add1_name                  character varying(200)         ,
  hp_add2_name                  character varying(200)         ,
  hp_add3_name                  character varying(200)         ,
  hp_tel                        character varying(13)          ,
  hp_cd                         character varying(13)          ,
  del_flg                       integer DEFAULT 0              ,
  register_user_id              character varying(30)          ,
  register_date                 timestamp without time zone    ,
  update_user_id                character varying(30)          ,
  update_date                   timestamp without time zone    ,
  CONSTRAINT hp_master_pk PRIMARY KEY (hp_no)
);

CREATE TABLE drug_user.hpdtl_master
(
  hp_no                         integer NOT NULL              ,
  ka_flg                        integer NOT NULL              ,
  dr_no                         integer NOT NULL          ,
  del_flg                       integer DEFAULT 0              ,
  register_user_id              character varying(30)          ,
  register_date                 timestamp without time zone    ,
  update_user_id                character varying(30)          ,
  update_date                   timestamp without time zone    ,
  CONSTRAINT hpdtl_master_pk PRIMARY KEY (hp_no,ka_flg,dr_no)
);

CREATE TABLE drug_user.dr_master
(
  dr_no                         integer NOT NULL          ,
  dr_name                       character varying(50)          ,
  hp_no                         integer DEFAULT 0              ,
  ka_no                         integer DEFAULT 0              ,
  del_flg                       integer DEFAULT 0              ,
  register_user_id              character varying(30)          ,
  register_date                 timestamp without time zone    ,
  update_user_id                character varying(30)          ,
  update_date                   timestamp without time zone    ,
  CONSTRAINT dr_master_pk PRIMARY KEY (dr_no)
);

CREATE TABLE drug_user.ka_master
(
  ka_no                         integer NOT NULL          ,
  ka_name                       character varying(50)          ,
  del_flg                       integer DEFAULT 0              ,
  register_user_id              character varying(30)          ,
  register_date                 timestamp without time zone    ,
  update_user_id                character varying(30)          ,
  update_date                   timestamp without time zone    ,
  CONSTRAINT ka_master_pk PRIMARY KEY (ka_no)
);

CREATE TABLE drug_user.name_master
(
  name_kbn                      integer NOT NULL          ,
  name_no                       integer NOT NULL          ,
  nm_name                       character varying(200)    ,
  name1_flg                     integer DEFAULT 0              ,
  name2_flg                     integer DEFAULT 0              ,
  name3_flg                     integer DEFAULT 0              ,
  name4_flg                     integer DEFAULT 0              ,
  name5_flg                     integer DEFAULT 0              ,
  del_flg                       integer DEFAULT 0              ,
  register_user_id              character varying(30)          ,
  register_date                 timestamp without time zone    ,
  update_user_id                character varying(30)          ,
  update_date                   timestamp without time zone    ,
  CONSTRAINT name_master_pk PRIMARY KEY (name_kbn,name_no)
);

CREATE TABLE drug_user.nomi_master
(
  nomi_no                       integer NOT NULL                ,
  nomi_name                     character varying(200)          ,
  times_no                      integer DEFAULT 0               ,
  nomi_name_flg                 character varying(6)          ,
  del_flg                       integer DEFAULT 0              ,
  register_user_id              character varying(30)          ,
  register_date                 timestamp without time zone    ,
  update_user_id                character varying(30)          ,
  update_date                   timestamp without time zone    ,
  CONSTRAINT nomi_master_pk PRIMARY KEY (nomi_no)
);

CREATE TABLE drug_user.kasan_master
(
  kasan_no                      integer NOT NULL                ,
  kasan_name                    character varying(50)           ,
  kasan_p                       integer DEFAULT 0               ,
  del_flg                       integer DEFAULT 0              ,
  register_user_id              character varying(30)          ,
  register_date                 timestamp without time zone    ,
  update_user_id                character varying(30)          ,
  update_date                   timestamp without time zone    ,
  CONSTRAINT kasan_master_pk PRIMARY KEY (kasan_no)
);




commit;

INSERT INTO drug_user.md_master VALUES ( 1,'モンテルカスト錠10mg[タカタ]',1,1,'夕食後','説明',0,'2019-02-07 18:00:00.000000000',null,null);
INSERT INTO drug_user.md_master VALUES ( 2,'ロラタジン錠[NP]',1,1,'夕食後','説明',0,'2019-02-07 18:00:00.000000000',null,null);
INSERT INTO drug_user.md_master VALUES ( 3,'デキストロメトルファン臭化水素酸塩錠15mg[トーワ]',1,1,'１日３回朝昼夕食後','説明',0,'2019-02-07 18:00:00.000000000',null,null);

INSERT INTO drug_user.hp_master VALUES ( 1,'関東労災病院',0,'神奈川県川崎市中原区1234','2','3','tel','hpcd',0,'2019-02-07 18:00:00.000000000',null,null);
INSERT INTO drug_user.hp_master VALUES ( 2,'横浜市立市民病院',0,'神奈川県横浜市戸塚区1234','2','3','tel','hpcd',0,'2019-02-07 18:00:00.000000000',null,null);
INSERT INTO drug_user.hp_master VALUES ( 3,'かとうクリニック',0,'神奈川県横浜市港北区1234','2','3','tel','hpcd',0,'2019-02-07 18:00:00.000000000',null,null);

INSERT INTO drug_user.hpdtl_master VALUES ( 1,1,1,0,'2019-02-07 18:00:00.000000000',null,null);
INSERT INTO drug_user.hpdtl_master VALUES ( 1,2,1,0,'2019-02-07 18:00:00.000000000',null,null);
INSERT INTO drug_user.hpdtl_master VALUES ( 1,1,2,0,'2019-02-07 18:00:00.000000000',null,null);
INSERT INTO drug_user.hpdtl_master VALUES ( 2,1,3,0,'2019-02-07 18:00:00.000000000',null,null);
INSERT INTO drug_user.hpdtl_master VALUES ( 2,1,4,0,'2019-02-07 18:00:00.000000000',null,null);
INSERT INTO drug_user.hpdtl_master VALUES ( 3,1,1,0,'2019-02-07 18:00:00.000000000',null,null);
INSERT INTO drug_user.hpdtl_master VALUES ( 3,2,1,0,'2019-02-07 18:00:00.000000000',null,null);
INSERT INTO drug_user.hpdtl_master VALUES ( 3,3,1,0,'2019-02-07 18:00:00.000000000',null,null);
INSERT INTO drug_user.hpdtl_master VALUES ( 3,1,5,0,'2019-02-07 18:00:00.000000000',null,null);
INSERT INTO drug_user.hpdtl_master VALUES ( 3,2,5,0,'2019-02-07 18:00:00.000000000',null,null);

INSERT INTO drug_user.dr_master VALUES ( 1,'先生１',0,0,0,'2019-02-07 18:00:00.000000000',null,null);
INSERT INTO drug_user.dr_master VALUES ( 2,'先生２',0,0,0,'2019-02-07 18:00:00.000000000',null,null);
INSERT INTO drug_user.dr_master VALUES ( 3,'先生３',0,0,0,'2019-02-07 18:00:00.000000000',null,null);
INSERT INTO drug_user.dr_master VALUES ( 4,'先生４',0,0,0,'2019-02-07 18:00:00.000000000',null,null);
INSERT INTO drug_user.dr_master VALUES ( 5,'先生５',0,0,0,'2019-02-07 18:00:00.000000000',null,null);

INSERT INTO drug_user.name_master VALUES (1, 1,'小児科',0,0,0,0,0,0,'2019-02-07 18:00:00.000000000',null,null);
INSERT INTO drug_user.name_master VALUES (1, 2,'内科',0,0,0,0,0,0,'2019-02-07 18:00:00.000000000',null,null);
INSERT INTO drug_user.name_master VALUES (1, 3,'呼吸器科',0,0,0,0,0,0,'2019-02-07 18:00:00.000000000',null,null);
INSERT INTO drug_user.name_master VALUES (1, 4,'外科',0,0,0,0,0,0,'2019-02-07 18:00:00.000000000',null,null);
INSERT INTO drug_user.name_master VALUES (1, 5,'泌尿器科',0,0,0,0,0,0,'2019-02-07 18:00:00.000000000',null,null);

INSERT INTO drug_user.pt_master VALUES ( 1,'患者１','1979-05-22 00:00:00.000000000',1000000001,'A0000001','B00001',1,'2020-02-07 18:00:00.000000000',0,'admin','2019-02-09 11:00:00.000000000',null,null);
INSERT INTO drug_user.pt_master VALUES ( 2,'患者２','1980-06-22 00:00:00.000000000',1000000002,'A0000002','B00002',1,'2020-02-08 18:00:00.000000000',0,'admin','2019-02-09 11:00:00.000000000',null,null);
INSERT INTO drug_user.pt_master VALUES ( 3,'患者３','1981-07-22 00:00:00.000000000',1000000003,'A0000003','B00003',1,'2020-02-09 18:00:00.000000000',0,'admin','2019-02-09 11:00:00.000000000',null,null);
INSERT INTO drug_user.pt_master VALUES ( 4,'患者４','1982-08-22 00:00:00.000000000',1000000004,'A0000004','B00004',1,'2020-02-10 18:00:00.000000000',0,'admin','2019-02-09 11:00:00.000000000',null,null);
INSERT INTO drug_user.pt_master VALUES ( 5,'患者５','1983-09-22 00:00:00.000000000',1000000005,'A0000005','B00005',1,'2020-02-11 18:00:00.000000000',0,'admin','2019-02-09 11:00:00.000000000',null,null);

INSERT INTO drug_user.pt_tran VALUES ( 1,'2019-02-08 10:00:00.000000000',1,1,1,0,'admin','2019-02-09 11:00:00.000000000',null,null);
INSERT INTO drug_user.pt_tran VALUES ( 2,'2019-02-08 11:00:00.000000000',2,1,2,0,'admin','2019-02-09 11:00:00.000000000',null,null);
INSERT INTO drug_user.pt_tran VALUES ( 3,'2019-02-08 12:00:00.000000000',3,1,3,0,'admin','2019-02-09 11:00:00.000000000',null,null);
INSERT INTO drug_user.pt_tran VALUES ( 4,'2019-02-09 11:00:00.000000000',4,2,4,0,'admin','2019-02-09 11:00:00.000000000',null,null);
INSERT INTO drug_user.pt_tran VALUES ( 5,'2019-02-09 12:00:00.000000000',5,2,5,0,'admin','2019-02-09 11:00:00.000000000',null,null);
INSERT INTO drug_user.pt_tran VALUES ( 6,'2019-02-09 13:00:00.000000000',1,1,1,0,'admin','2019-02-09 11:00:00.000000000',null,null);
INSERT INTO drug_user.pt_tran VALUES ( 7,'2019-02-10 14:00:00.000000000',2,1,2,0,'admin','2019-02-09 11:00:00.000000000',null,null);


COMMIT;

EOSQL