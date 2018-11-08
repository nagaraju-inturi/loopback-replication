cdr define repl rep1 -M g_informix -C always -S row -A -R "P ycsb@g_informix:informix.usertable" "select * from usertable" "R ycsb@g_lb:informix.usertable_new" "select * from usertable_new"
cdr start repl rep1
