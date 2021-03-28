DROP TABLE MEMBER
CASCADE CONSTRAINTS;

DROP TABLE BBS
CASCADE CONSTRAINTS;



INSERT INTO MEMBER(
MEMBERID, PWD, EMAIL, NAME, PHONENUM, GENDER,
TRAINERID, PROFILEIMG, AGE, HEIGHT, GWEIGHT, MEMLEVEL,
MEMTYPE, GYMNAME, TRAINERCONTENT, WEIGHT
)
VALUES(
'aaa', 'aaa', 'a@a.com', '홍길동', 01012345678, 'Male',
'ccc', NULL, 23, 170, 65, 30, 
0, NULL, NULL, 70);


SELECT *
FROM MEMBER;





CREATE TABLE "HR"."MEMBER" 
   (	"MEMBERID" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"PWD" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"EMAIL" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"NAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"PHONENUM" NUMBER(20,0) NOT NULL ENABLE, 
	"GENDER" VARCHAR2(5 BYTE) NOT NULL ENABLE, 
	"TRAINERID" VARCHAR2(20 BYTE), 
	"PROFILEIMG" VARCHAR2(50 BYTE), 
	"AGE" NUMBER(5,0), 
	"HEIGHT" NUMBER(5,0), 
	"GWEIGHT" NUMBER(5,0), 
	"MEMLEVEL" NUMBER(30,0) NOT NULL ENABLE, 
	"MEMTYPE" NUMBER(3,0) NOT NULL ENABLE, 
	"GYMNAME" VARCHAR2(100 BYTE), 
	"TRAINERCONTENT" VARCHAR2(400 BYTE), 
	"WEIGHT" NUMBER(5,0), 
	 CONSTRAINT "MEMBER_PK" PRIMARY KEY ("MEMBERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;


  
  
  
  
------------------------------------------------------------------------------------------------------------------------------------

 CREATE TABLE "HR"."BBS" 
   (	"MEMBERID" VARCHAR2(20 BYTE), 
	"SEQ" NUMBER(8,0) NOT NULL ENABLE, 
	"REF" NUMBER(8,0) NOT NULL ENABLE, 
	"STEP" NUMBER(8,0) NOT NULL ENABLE, 
	"DEPTH" NUMBER(8,0) NOT NULL ENABLE, 
	"TITLE" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"CONTENT" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"WDATE" DATE NOT NULL ENABLE, 
	"DEL" NUMBER(1,0) NOT NULL ENABLE, 
	"READCOUNT" NUMBER(8,0) NOT NULL ENABLE, 
	"LIKECOUNT" NUMBER(8,0) NOT NULL ENABLE, 
	"IMG" VARCHAR2(20 BYTE), 
	 CONSTRAINT "BBS_PK" PRIMARY KEY ("SEQ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_BBS_MEMBERID" FOREIGN KEY ("MEMBERID")
	  REFERENCES "HR"."MEMBER" ("MEMBERID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

------------------------------------------------------------------------------------------------------------------------------------

  CREATE TABLE "HR"."CALENDAR" 
   (	"SEQ" NUMBER(8,0), 
	"ID" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"TITLE" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"CONTENT" VARCHAR2(4000 BYTE), 
	"RDATE" VARCHAR2(12 BYTE) NOT NULL ENABLE, 
	"WDATE" DATE NOT NULL ENABLE, 
	 PRIMARY KEY ("SEQ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;


------------------------------------------------------------------------------------------------------------------------------------


 CREATE TABLE "HR"."BADGE" 
   (	"MEMBERID" VARCHAR2(20 BYTE), 
	"BADGE" VARCHAR2(20 BYTE), 
	 CONSTRAINT "FK_BADGE_MEMBERID" FOREIGN KEY ("MEMBERID")
	  REFERENCES "HR"."MEMBER" ("MEMBERID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;


------------------------------------------------------------------------------------------------------------------------------------

  CREATE TABLE "HR"."EXERCALENDAR" 
   (	"CALSEQ" NUMBER(8,0) NOT NULL ENABLE, 
	"MEMBERID" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"CALTITLE" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"CALCONTENT" VARCHAR2(4000 BYTE) NOT NULL ENABLE, 
	"CALWDATE" DATE NOT NULL ENABLE, 
	"CALRDATE" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "EXERCALENDAR_PK" PRIMARY KEY ("CALSEQ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_EXERCALENDAR_MEMBERID" FOREIGN KEY ("MEMBERID")
	  REFERENCES "HR"."MEMBER" ("MEMBERID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

------------------------------------------------------------------------------------------------------------------------------------



  CREATE TABLE "HR"."EXERCISE" 
   (	"EXID" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"PART" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"DIFFICULTY" NUMBER(10,0) NOT NULL ENABLE, 
	"TYPE" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"EXCONTENT" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"EXIMG" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"EXADDRESS" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "MOVIETABLE_PK" PRIMARY KEY ("EXID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;


------------------------------------------------------------------------------------------------------------------------------------


  CREATE TABLE "HR"."MYROUTINE" 
   (	"MEMBERID" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"EXID" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "FK_MYROOTIN_MEMBERID" FOREIGN KEY ("MEMBERID")
	  REFERENCES "HR"."MEMBER" ("MEMBERID") ENABLE, 
	 CONSTRAINT "FK_MYROOTIN_VIDEOID" FOREIGN KEY ("EXID")
	  REFERENCES "HR"."EXERCISE" ("EXID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;


------------------------------------------------------------------------------------------------------------------------------------

  CREATE TABLE "HR"."WCHART" 
   (	"MEMBERID" VARCHAR2(20 BYTE), 
	"WDATE" DATE, 
	"DWEIGHT" NUMBER(5,0), 
	 CONSTRAINT "FK_SCHEDULES_MEMBERID" FOREIGN KEY ("MEMBERID")
	  REFERENCES "HR"."MEMBER" ("MEMBERID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

------------------------------------------------------------------------------------------------------------------------------------


  CREATE TABLE "HR"."REVIEW" 
   (	"TRAINERID" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"TRAINERCOMMENT" VARCHAR2(400 BYTE) NOT NULL ENABLE, 
	"MEMBERID" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"EXID" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"EXCOMMENT" VARCHAR2(400 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "FK_TRAINERREVIEW_MEMBERID" FOREIGN KEY ("MEMBERID")
	  REFERENCES "HR"."MEMBER" ("MEMBERID") ENABLE, 
	 CONSTRAINT "FK_REVIEW_VIDEOID" FOREIGN KEY ("EXID")
	  REFERENCES "HR"."EXERCISE" ("EXID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;



