alias t="sensors |grep Core"
alias s="uptime ; echo \"--\" ; free -m ; echo \"--\" ; t ; grep \"cpu MHz\" /proc/cpuinfo ; cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor ; sensors G CPU ; /usr/sbin/hddtemp -q /dev/sda ; /usr/sbin/hddtemp -q /dev/sdb ; echo -ne \"GeForce temp: \" ; nvidia-settings -q gpucoretemp -t"
alias rm="rm -I"
alias w="w -f"
alias aria2cSl="aria2c -s 5 --max-download-limit=200K"
alias aria2cS="aria2c -s 5"
alias du="du -h --max-depth=1"
alias DU="du -h --max-depth=0 *"
alias sc="screen -x"
alias sci=" ssh s2.rootnode.net -t 'screen -x i'"
alias sce=" ssh s2.rootnode.net -t 'screen -x e'"

alias e='vim'
