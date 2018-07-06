database sysadmin;
EXECUTE FUNCTION task("CREATE DBSPACE FROM STORAGEPOOL", "dbsp1", "1G");
EXECUTE FUNCTION task("CREATE DBSPACE FROM STORAGEPOOL", "dbsp2", "1G");
EXECUTE FUNCTION task("CREATE DBSPACE FROM STORAGEPOOL", "dbsp3", "1G");
database ycsb;
CREATE RAW TABLE usertable_new(
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
) fragment by round robin dbsp1, dbsp2, dbsp3 lock mode row;
create unique index pix1 on usertable_new(YCSB_KEY) in dbsp1;

