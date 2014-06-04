function nowUnix() {
  date +%s
}

#doorstatus=`/usr/local/bin/gpio -g read 4`
doorstatus=0

oldstatus=`cat laststate`

if [ "$?" -eq 1 ]
then
  nowUnix > laststate
  exit 0
fi

if [ "$doorstatus" -eq 1 ]
then
  echo $doorstatus > laststate
  exit 0
else
  # oldstatus = 3242308234 || oldstatus = 1
  if [ "$oldstatus" -ne 1 ]
  then
   nowUnix > laststate
   exit 0
  else
    now=nowUnix
    timeDiff=`expr $now - $oldstatus`
    echo $timeDiff
  fi
fi
