alter table if exists MOVIES drop constraint if exists FKpe7a6akhuk8fny87bf559kla8;
alter table if exists MOVIES drop constraint if exists FK5bd325xyjdbw7hayton719egf;
alter table if exists MOVIES drop constraint if exists FKebhuuxs8f4gr9odalkt93wf1s;
alter table if exists MOVIES drop constraint if exists FK6hsrejdr4pp81ci703u543l5i;
alter table if exists MOVIES drop constraint if exists FKpdew437fhj2osowoktar8r7dk;
alter table if exists MOVIES_audios drop constraint if exists FKociyq86qsw030e2wj5pynl2t9;
alter table if exists MOVIES_audios drop constraint if exists FKpk72gwixm3g5thtb6elbx0rbo;
alter table if exists MOVIES_subtitles drop constraint if exists FK49wbi9mjh2q2iuv0u21y9e5lw;
alter table if exists MOVIES_subtitles drop constraint if exists FKo9ob7xaglm75cng4n1bh28b80;

drop table if exists MOVIES CASCADE;
drop table if exists GENRES CASCADE;
drop table if exists DIRECTORS CASCADE;
drop table if exists CODEC_FORMATS CASCADE;
drop table if exists AUDIOS CASCADE;
drop table if exists SUBTITLES CASCADE;
drop table if exists STORAGE_TYPES CASCADE;
drop table if exists MOVIES_audios CASCADE;
drop table if exists MOVIES_subtitles CASCADE;
drop table if exists IMAGES cascade;

create table MOVIES (
       ID int8 generated by default as identity,
        TITLE_ENGLISH varchar(255),
        TITLE_HUN varchar(255),
        TITLE_ORIGINAL varchar(255),
        DURATION time,
        RELEASE_YEAR int4,
        X_RESOLUTION int4,
        Y_RESOLUTION int4,
        STORAGE_NUMBER int4,
        CODEC_FORMAT_ID int8,
        DIRECTOR_ID int8,
        GENRE_ID int8,
        STORAGE_TYPE_ID int8,
        IMAGE_ID int8,
        primary key (ID)
);

create table GENRES (
       ID int8 generated by default as identity,
        NAME varchar(255),
        primary key (ID)
);

create table DIRECTORS (
       ID int8 generated by default as identity,
        BIRTHDAY date,
        NAME varchar(255),
        primary key (ID)
);

create table CODEC_FORMATS (
       ID int8 generated by default as identity,
        NAME varchar(255),
        primary key (ID)
);

create table AUDIOS (
       ID int8 generated by default as identity,
        LANGUAGE varchar(255),
        primary key (ID)
);

create table SUBTITLES (
       ID int8 generated by default as identity,
        LANGUAGE varchar(255),
        primary key (ID)
);

create table STORAGE_TYPES (
       ID int8 generated by default as identity,
        NAME varchar(255),
        primary key (ID)
);

create table IMAGES (
       ID int8 generated by default as identity,
        content oid,
        NAME varchar(255),
        primary key (ID)
);

create table MOVIES_audios (
       movies_ID int8 not null,
        audios_ID int8 not null,
        primary key (movies_ID, audios_ID)
);

create table MOVIES_subtitles (
       movies_ID int8 not null,
        subtitles_ID int8 not null,
        primary key (movies_ID, subtitles_ID)
);

alter table if exists MOVIES
       add constraint FKebhuuxs8f4gr9odalkt93wf1s
       foreign key (GENRE_ID)
       references GENRES;

alter table if exists MOVIES
       add constraint FK5bd325xyjdbw7hayton719egf
       foreign key (DIRECTOR_ID)
       references DIRECTORS;

alter table if exists MOVIES
       add constraint FKpe7a6akhuk8fny87bf559kla8
       foreign key (CODEC_FORMAT_ID)
       references CODEC_FORMATS;

alter table if exists MOVIES
       add constraint FK6hsrejdr4pp81ci703u543l5i
       foreign key (STORAGE_TYPE_ID)
       references STORAGE_TYPES;

alter table if exists MOVIES_audios
       add constraint FKociyq86qsw030e2wj5pynl2t9
       foreign key (audios_ID)
       references AUDIOS;

alter table if exists MOVIES_audios
       add constraint FKpk72gwixm3g5thtb6elbx0rbo
       foreign key (movies_ID)
       references MOVIES;

alter table if exists MOVIES_subtitles
       add constraint FK49wbi9mjh2q2iuv0u21y9e5lw
       foreign key (subtitles_ID)
       references SUBTITLES;

alter table if exists MOVIES_subtitles
       add constraint FKo9ob7xaglm75cng4n1bh28b80
       foreign key (movies_ID)
       references MOVIES;

alter table if exists MOVIES
       add constraint FKpdew437fhj2osowoktar8r7dk
       foreign key (IMAGE_ID)
       references IMAGES;

insert into MOVIES (TITLE_HUN, TITLE_ORIGINAL, DURATION, RELEASE_YEAR)
    values ('Legyetek jók ha tudtok', 'Stat buoni se potete', '02:19:17', 1983);

insert into MOVIES (TITLE_HUN, TITLE_ENGLISH, DURATION, RELEASE_YEAR)
    values ('A segítség', 'The help', '02:26:20', 2011);

insert into GENRES (NAME) values ('akció');
insert into GENRES (NAME) values ('vígjáték');
insert into GENRES (NAME) values ('dráma');
insert into GENRES (NAME) values ('történelmi');
insert into GENRES (NAME) values ('western');
insert into GENRES (NAME) values ('fantasy');
insert into GENRES (NAME)  values ('sci-fi');
insert into GENRES (NAME) values ('horror');
insert into GENRES (NAME) values ('thriller');
insert into GENRES (NAME) values ('romantikus');
insert into GENRES (NAME) values ('rajzfilm');
insert into GENRES (NAME) values ('anime');
insert into GENRES (NAME) values ('dokumentum');
insert into GENRES (NAME) values ('természet-film');
insert into GENRES (NAME) values ('utifilm');
insert into GENRES (NAME) values ('háborús-film');
insert into GENRES (NAME) values ('némafilm');

insert into CODEC_FORMATS (NAME) values ('H264-BRRIP');
insert into CODEC_FORMATS (NAME) values ('H264-WEBRIP');
insert into CODEC_FORMATS (NAME) values ('H264-1080P');
insert into CODEC_FORMATS (NAME) values ('H264-720P');
insert into CODEC_FORMATS (NAME) values ('H265');
insert into CODEC_FORMATS (NAME) values ('H265-4K');
insert into CODEC_FORMATS (NAME) values ('XVID');
insert into CODEC_FORMATS (NAME) values ('DIVX');
insert into CODEC_FORMATS (NAME) values ('VHS');
insert into CODEC_FORMATS (NAME) values ('DVD');
insert into CODEC_FORMATS (NAME) values ('BLURAY');

insert into storage_types (name) values ('HDD');
insert into storage_types (name) values ('VHS-KAZETTA');
insert into storage_types (name) values ('DVD-LEMEZ');
insert into storage_types (name) values ('BLURAY-LEMEZ');

insert into audios (language) values ('magyar');
insert into audios (language) values ('angol');
insert into audios (language) values ('koreai');
insert into audios (language) values ('kínai');
insert into audios (language) values ('japán');

insert into subtitles (language) values ('magyar');
insert into subtitles (language) values ('magyar-kiegészítő');
insert into subtitles (language) values ('angol');
insert into subtitles (language) values ('angol-kiegészítő');

insert into DIRECTORS (NAME, BIRTHDAY) values ('Luigi Magni', '1928-03-21');
insert into DIRECTORS (NAME, BIRTHDAY) values ('Tate Taylor', '1969-06-03');
