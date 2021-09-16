while true; do
  surf http://prnt.sc/$(cat /dev/urandom | tr -dc 'a-z' | head -c 2)$(cat /dev/urandom | tr -dc '0-9' | head -c 4)
done
