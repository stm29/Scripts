if [[ $(ps -ef | grep nibbler | grep 6605 | wc -l) -eq 1 ]]
 then
   echo "Nibbler is running" >> nibbler.log
   if [[ $(ps -ef | grep nibbler | grep 6605 | awk '{print $1}') == "ubuntu" ]]
     then
       echo "Nibbler is running as ubuntu" >> nibbler.log
     else
       echo "Nibbler is NOT running as ubuntu" >> nibbler.log
       sudo kill $(ps -ef | grep nibbler | grep 6605 | awk '{print $2}')
         if [[ $(ps -ef | grep nibbler | grep 6605 | awk '{print $1}') == "ubuntu" ]]
           then
           echo "Nibbler is running as ubuntu after Killing the PID" >> nibbler.log
         fi
   fi
 else
  echo "Nibbler is NOT running" >> nibbler.log
         if [[ $(ps -ef | grep nibbler_watchdog | grep 6610 | wc -l) -eq 1 ]]
           then
           echo "Nibbler_Watchdog is also NOT running" >> nibbler.log
         fi 
  sudo kill $(ps -ef | grep nibbler | grep 6605 | awk '{print $2}')
  sudo kill $(ps -ef | grep nibbler | grep 6610 | awk '{print $2}')
  sudo su - ubuntu
  screen -d -m -S runningNibbler /home/ubuntu/nibbler-current/bin/run_nibbler.sh
          if [[ $(ps -ef | grep nibbler | grep 6605 | awk '{print $1}') == "ubuntu" ]]
           then
           echo "Nibbler is running as ubuntu after by screen" >> nibbler.log
         fi
 fi
