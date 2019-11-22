/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2014                    */
/* Created on:     11/22/2019 2:24:16 PM                        */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PRODUCTO') and o.name = 'FK_PRODUCTO_MIDE_MEDIDA')
alter table PRODUCTO
   drop constraint FK_PRODUCTO_MIDE_MEDIDA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PRODUCTO') and o.name = 'FK_PRODUCTO_SE_CLASIF_CATEGORI')
alter table PRODUCTO
   drop constraint FK_PRODUCTO_SE_CLASIF_CATEGORI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PRODUCTO') and o.name = 'FK_PRODUCTO_TIENE_MARCA')
alter table PRODUCTO
   drop constraint FK_PRODUCTO_TIENE_MARCA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('REPORTE') and o.name = 'FK_REPORTE_GENERA_SONDEO')
alter table REPORTE
   drop constraint FK_REPORTE_GENERA_SONDEO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('REPORTE') and o.name = 'FK_REPORTE_GENERA2_USUARIO')
alter table REPORTE
   drop constraint FK_REPORTE_GENERA2_USUARIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SONDEO') and o.name = 'FK_SONDEO_SE_COMPON_PRODUCTO')
alter table SONDEO
   drop constraint FK_SONDEO_SE_COMPON_PRODUCTO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SONDEO') and o.name = 'FK_SONDEO_SE_REALIZ_LOCALIZA')
alter table SONDEO
   drop constraint FK_SONDEO_SE_REALIZ_LOCALIZA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('USUARIO') and o.name = 'FK_USUARIO_ES_CLIENTE')
alter table USUARIO
   drop constraint FK_USUARIO_ES_CLIENTE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CATEGORIA')
            and   type = 'U')
   drop table CATEGORIA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CLIENTE')
            and   type = 'U')
   drop table CLIENTE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LOCALIZACION')
            and   type = 'U')
   drop table LOCALIZACION
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MARCA')
            and   type = 'U')
   drop table MARCA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MEDIDA')
            and   type = 'U')
   drop table MEDIDA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PRODUCTO')
            and   name  = 'TIENE_FK'
            and   indid > 0
            and   indid < 255)
   drop index PRODUCTO.TIENE_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PRODUCTO')
            and   name  = 'MIDE_FK'
            and   indid > 0
            and   indid < 255)
   drop index PRODUCTO.MIDE_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PRODUCTO')
            and   name  = 'SE_CLASIFICA_FK'
            and   indid > 0
            and   indid < 255)
   drop index PRODUCTO.SE_CLASIFICA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PRODUCTO')
            and   type = 'U')
   drop table PRODUCTO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('REPORTE')
            and   name  = 'GENERA2_FK'
            and   indid > 0
            and   indid < 255)
   drop index REPORTE.GENERA2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('REPORTE')
            and   name  = 'GENERA_FK'
            and   indid > 0
            and   indid < 255)
   drop index REPORTE.GENERA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('REPORTE')
            and   type = 'U')
   drop table REPORTE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SONDEO')
            and   name  = 'SE_COMPONE_FK'
            and   indid > 0
            and   indid < 255)
   drop index SONDEO.SE_COMPONE_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SONDEO')
            and   name  = 'SE_REALIZA_FK'
            and   indid > 0
            and   indid < 255)
   drop index SONDEO.SE_REALIZA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SONDEO')
            and   type = 'U')
   drop table SONDEO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('USUARIO')
            and   name  = 'ES_FK'
            and   indid > 0
            and   indid < 255)
   drop index USUARIO.ES_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('USUARIO')
            and   type = 'U')
   drop table USUARIO
go

/*==============================================================*/
/* Table: CATEGORIA                                             */
/*==============================================================*/
create table CATEGORIA (
   ID_CATEGORIA         varchar(10)          not null,
   CATEGORIA            varchar(25)          not null,
   DESCRIPCION_CAT      varchar(100)         not null,
   constraint PK_CATEGORIA primary key (ID_CATEGORIA)
)
go

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   DOCUMENTO            varchar(10)          not null,
   APELLIDO             varchar(100)         not null,
   NOMBRE               varchar(100)         not null,
   constraint PK_CLIENTE primary key (DOCUMENTO)
)
go

/*==============================================================*/
/* Table: LOCALIZACION                                          */
/*==============================================================*/
create table LOCALIZACION (
   ID_LOCAL             int                  not null,
   LOCALIDAD            varchar(50)          not null,
   DEPARTAMENTO         varchar(25)          not null,
   MUNICIPIO            varchar(50)          not null,
   AREA                 varchar(50)          not null,
   constraint PK_LOCALIZACION primary key (ID_LOCAL)
)
go

/*==============================================================*/
/* Table: MARCA                                                 */
/*==============================================================*/
create table MARCA (
   ID_MARCA             varchar(10)          not null,
   MARCA                varchar(50)          not null,
   constraint PK_MARCA primary key (ID_MARCA)
)
go

/*==============================================================*/
/* Table: MEDIDA                                                */
/*==============================================================*/
create table MEDIDA (
   UNIDAD_MEDIDA        varchar(5)           not null,
   CANTIDAD             int                  not null,
   constraint PK_MEDIDA primary key (UNIDAD_MEDIDA)
)
go

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO (
   ID_PRODUCTO          varchar(25)          not null,
   ID_CATEGORIA         varchar(10)          null,
   UNIDAD_MEDIDA        varchar(5)           null,
   ID_MARCA             varchar(10)          null,
   PRODUCTO             varchar(50)          not null,
   PRESENTACION         varchar(50)          not null,
   PRECIO_CONSULTA      numeric(8,2)         not null,
   TIPO                 varchar(50)          not null,
   constraint PK_PRODUCTO primary key (ID_PRODUCTO)
)
go

/*==============================================================*/
/* Index: SE_CLASIFICA_FK                                       */
/*==============================================================*/




create nonclustered index SE_CLASIFICA_FK on PRODUCTO (ID_CATEGORIA ASC)
go

/*==============================================================*/
/* Index: MIDE_FK                                               */
/*==============================================================*/




create nonclustered index MIDE_FK on PRODUCTO (UNIDAD_MEDIDA ASC)
go

/*==============================================================*/
/* Index: TIENE_FK                                              */
/*==============================================================*/




create nonclustered index TIENE_FK on PRODUCTO (ID_MARCA ASC)
go

/*==============================================================*/
/* Table: REPORTE                                               */
/*==============================================================*/
create table REPORTE (
   ID_REPORTE           varchar(25)          not null,
   ID_SONDEO            varchar(50)          null,
   ID_USUARIO           varchar(50)          null,
   FECHA_REPORTE        datetime             not null,
   constraint PK_REPORTE primary key (ID_REPORTE)
)
go

/*==============================================================*/
/* Index: GENERA_FK                                             */
/*==============================================================*/




create nonclustered index GENERA_FK on REPORTE (ID_SONDEO ASC)
go

/*==============================================================*/
/* Index: GENERA2_FK                                            */
/*==============================================================*/




create nonclustered index GENERA2_FK on REPORTE (ID_USUARIO ASC)
go

/*==============================================================*/
/* Table: SONDEO                                                */
/*==============================================================*/
create table SONDEO (
   ID_SONDEO            varchar(50)          not null,
   ID_LOCAL             int                  not null,
   ID_PRODUCTO          varchar(25)          null,
   FECHA                datetime             not null,
   DESCRIPCION          varchar(1024)        not null,
   constraint PK_SONDEO primary key (ID_SONDEO)
)
go

/*==============================================================*/
/* Index: SE_REALIZA_FK                                         */
/*==============================================================*/




create nonclustered index SE_REALIZA_FK on SONDEO (ID_LOCAL ASC)
go

/*==============================================================*/
/* Index: SE_COMPONE_FK                                         */
/*==============================================================*/




create nonclustered index SE_COMPONE_FK on SONDEO (ID_PRODUCTO ASC)
go

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   ID_USUARIO           varchar(50)          not null,
   DOCUMENTO            varchar(10)          null,
   PASSWORD             varchar(10)          not null,
   ROL                  varchar(10)          not null,
   constraint PK_USUARIO primary key (ID_USUARIO)
)
go

/*==============================================================*/
/* Index: ES_FK                                                 */
/*==============================================================*/




create nonclustered index ES_FK on USUARIO (DOCUMENTO ASC)
go

alter table PRODUCTO
   add constraint FK_PRODUCTO_MIDE_MEDIDA foreign key (UNIDAD_MEDIDA)
      references MEDIDA (UNIDAD_MEDIDA)
go

alter table PRODUCTO
   add constraint FK_PRODUCTO_SE_CLASIF_CATEGORI foreign key (ID_CATEGORIA)
      references CATEGORIA (ID_CATEGORIA)
go

alter table PRODUCTO
   add constraint FK_PRODUCTO_TIENE_MARCA foreign key (ID_MARCA)
      references MARCA (ID_MARCA)
go

alter table REPORTE
   add constraint FK_REPORTE_GENERA_SONDEO foreign key (ID_SONDEO)
      references SONDEO (ID_SONDEO)
go

alter table REPORTE
   add constraint FK_REPORTE_GENERA2_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO)
go

alter table SONDEO
   add constraint FK_SONDEO_SE_COMPON_PRODUCTO foreign key (ID_PRODUCTO)
      references PRODUCTO (ID_PRODUCTO)
go

alter table SONDEO
   add constraint FK_SONDEO_SE_REALIZ_LOCALIZA foreign key (ID_LOCAL)
      references LOCALIZACION (ID_LOCAL)
go

alter table USUARIO
   add constraint FK_USUARIO_ES_CLIENTE foreign key (DOCUMENTO)
      references CLIENTE (DOCUMENTO)
go

