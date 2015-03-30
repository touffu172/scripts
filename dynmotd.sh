@@ -0,0 +1,57 @@
#!/bin/sh
# 
# /etc/dynmotd.sh
# 
# Script d'installation des serveurs jeux du Games
# 
# Version  : 1.0
# Date : 30/03/2015 
# Auteur : Touffu - zero.sur.zero@gmail.com
# Compatible : CentOS 6&7
# 

PROCCOUNT=`ps -Afl | wc -l`
LOAD1=`cat /proc/loadavg| gawk '{ print $1 }'`
LOAD5=`cat /proc/loadavg| gawk '{ print $2 }'`
LOAD15=`cat /proc/loadavg| gawk '{ print $3 }'`

#UPTIME=`uptime | gawk '{ print $3" days, "$5  }'`
UPTIME=`/usr/bin/cut -d. -f1 /proc/uptime`
UPTDAY=`bc <<< "scale=0;$UPTIME /24/60/60"`
UPTHOUR=`bc <<< "scale=0;$UPTIME /60/60%24"`
UPTMIN=`bc <<< "scale=0;$UPTIME /60%60"`

MEMTOT=`free -m | grep Mem | awk {'print $2'}`
MEMUSED=`free -m | grep Mem | awk {'print $3'}`
MEMPER=`free -m | awk '/Mem/ { printf("%3.1f%%", $3/$2*100) }'`

SWAPTOT=`free -m | grep Swap | awk {'print $2'}`
SWAPUSED=`free -m | grep Swap | awk {'print $3'}`
SWAPPER=`free -m | awk '/Swap/ { printf("%3.1f%%", $3/$2*100) }'`

IPADDR=`ip addr | grep eth0 | grep -v eth0: | awk {'print $2'}`

UPDATES=`yum check-update | egrep '.i386|.x86_64|.noarch|.src' | wc -l`

echo -e "\033[35m+++++++++++++++++++++++++: \033[31mSystem Data\033[35m :+++++++++++++++++++++++++++

   \033[0mHostname \033[35m= \033[1;32m`hostname`
 \033[0mIP Address \033[35m= \033[1;32m$IPADDR
     \033[0mKernel \033[35m= \033[1;32m`uname -r`
    \033[0mRelease \033[35m= \033[1;32m`cat /etc/redhat-release`
     \033[0mUptime \033[35m= \033[1;32m$UPTDAY days, $UPTHOUR hr $UPTMIN min
       \033[0mLoad \033[35m= \033[1;32m$LOAD1 $LOAD5 $LOAD15 for $PROCCOUNT process
     \033[0mMemory \033[35m= \033[1;32m$MEMUSED/$MEMTOT Mo ($MEMPER)
       \033[0mSwap \033[35m= \033[1;32m$SWAPUSED/$SWAPTOT Mo ($SWAPPER)
    \033[0mUpdates \033[35m= \033[31m$UPDATES\033[0m

\033[35m+++++++++++++++++++++++++: \033[31mDisc Usage\033[35m :++++++++++++++++++++++++++++

\033[0m`df -h`

\033[35m+++++++++++++++++++: \033[31mMaintenance Information\033[35m :+++++++++++++++++++++

\033[33m`cat /etc/motd-maint`

\033[35m+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\033[0m
Ce message est modifiable dans /etc/dynmotd.sh"
 No newline at end of file
