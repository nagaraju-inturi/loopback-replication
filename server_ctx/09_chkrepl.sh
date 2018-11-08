cdr check repl -r rep1 -m g_informix -a -R --extratargetrows=keep --name myjob &
sleep 1
cdr stats check -r 1 myjob
