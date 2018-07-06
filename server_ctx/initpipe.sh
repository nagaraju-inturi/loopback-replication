mkfifo /tmp/pipe
mkfifo /tmp/pipe2
onmode -p +2 FIFO
cat /tmp/pipe > /tmp/pipe2 &
