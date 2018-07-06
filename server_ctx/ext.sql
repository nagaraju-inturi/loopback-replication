create external table et_usertable sameas usertable using (datafiles("PIPE:/tmp/pipe"));
create external table et_usertable_new sameas usertable_new using (datafiles("PIPE:/tmp/pipe2"));
