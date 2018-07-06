database sysadmin;
EXECUTE FUNCTION task("CREATE DBSPACE FROM STORAGEPOOL", "ycsbdbs", "2G");
create database ycsb in ycsbdbs with log;
CREATE TABLE usertable(
  YCSB_KEY serial,
  FIELD1 CHAR (112),
  FIELD2 CHAR (112),
  FIELD3 lvarchar(112),
  FIELD4 CHAR (112),
  FIELD5 CHAR (112),
  FIELD6 CHAR (112),
  FIELD7 CHAR (112),
  FIELD8 CHAR (112),
  FIELD9 CHAR (112),
  FIELD10 CHAR (112)
) lock mode row;
alter table usertable add constraint primary key(YCSB_KEY);

