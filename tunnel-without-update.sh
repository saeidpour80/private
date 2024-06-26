#! /bin/bash

timedatectl set-timezone Asia/Tehran
# apt update -y
# apt upgrade -y
apt install sudo
apt install iptables -y
clear

Color_Off='\033[0m'       # Text Reset
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

echo -e "${Red}@@@@@@@@@@${Color_Off}${Blue}@@@@@@@@@@${Color_Off}${White}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${Color_Off}
${Red}@@@@@@@@@@${Color_Off}${Blue}@@@@@@@@@@${Color_Off}${White}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${Color_Off}
${Red}@@@&GG#&@@${Color_Off}${Blue}@@@#!!P@@@${Color_Off}${White}@@@&&&&@@@&&&&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@P7!#@@@@@@@${Color_Off}
${Red}@G.     &@${Color_Off}${Blue}@@@P  !@@@${Color_Off}${White}@@&    #@@7  7@@@@@@@@@@@@@@##&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@!  P@@@@@@@${Color_Off}
${Red}&   !##P&@${Color_Off}${Blue}@@@P  7@@@${Color_Off}${White}@@&    .&@!  !@@@@@@@@@@@@@P  7@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@7  P@@@@@@@${Color_Off}
${Red}@.  .5@@@@${Color_Off}${Blue}@@@P  7@@@${Color_Off}${White}@@&     .&7  7@@@#! ..^5@@?     @^..&@Y..B@G. J@@?.   ^B@@@...P: &@7  G@?. :#@${Color_Off}
${Red}@@J.   J@@${Color_Off}${Blue}@@@P  7@@@${Color_Off}${White}@@&   5  .~  7@@&  .#Y  J@G^  .?@B  !@   ^@.  &@:  ?P.  B@@   .7?@@7  ?^  ~&@@${Color_Off}
${Red}@@@@G.  ~@${Color_Off}${Blue}@@@P  7@@@${Color_Off}${White}@@&   &B     7@@P  .!~...@@G  7@@@!  J ^  ?  G@&   @@G  !@@   #@@@@7  .  .@@@@${Color_Off}
${Red}@5YBB.  .@${Color_Off}${Blue}@@@P  !@@@${Color_Off}${White}@@&   &@B    !@@&  .&&YYB@@P  !@@@@    #Y   ^@@@.  P#~  5@@   &@@@@!  PY  ^&@@${Color_Off}
${Red}@?    .!&@${Color_Off}${Blue}@@@G  7@@@${Color_Off}${White}@@&   &@@P   7@@@G. .. !&@@G  7@@@@P  ^@@   &@@@&^    .J@@@   &@@@@7  G@5  :&@${Color_Off}
${Red}@@&##&@@@@${Color_Off}${Blue}@@@@&&@@@@${Color_Off}${White}@@@&&&@@@@&&&@@@@@@&##@@@@@@&&@@@@@@&&@@@@&&@@@@@@&##&@@@@@&&&@@@@@@&&@@@&&&&@${Color_Off}
${Red}@@@@@@@@@@${Color_Off}${Blue}@@@@@@@@@@${Color_Off}${White}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${Color_Off}
${Red}@@@@@@@@@@${Color_Off}${Blue}@@@@@@@@@@${Color_Off}${White}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${Color_Off}
${Red}@@@@@@@@@@${Color_Off}${Blue}@@@@@@@@@@${Color_Off}${White}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${Color_Off}"
printf "\n\n"
printf "Please enter password : "
read -s pass
pass=$(echo  "$pass" | base64)
while [[ -z "$pass" ]] || [[ "$pass" != "JEA3MDhTbzI0NDBTYTIwMDEK" ]]
do
    echo -e "\n${Red}Invalid value, Try again${Color_Off}"
    printf "Please enter password : "
    read pass
done
printf "\n"
echo -e "${White}Which server are you on now ? ${Color_Off}"
printf "\n"
echo "--------------------------------------------------"
echo -e "${Purple}1) Iran${Color_Off}\n"
echo -e "${Cyan}2) Kharej${Color_Off}\n"
echo "--------------------------------------------------"
printf "\n"
printf "${White}Choose one of the options : ${Color_Off}"
read op
while [[ -z "$op" ]] || [[ !("$op" =~ ^[0-9]+$) ]]
do
    echo -e "\n${Red}Invalid value, Try again${Color_Off}"
    printf "${White}Choose one of the options : ${Color_Off}"
    read op
done
if [[ $op -eq 1 ]]
then
    printf "\n${White}Kharej IPV4 : ${Color_Off}"
    read khipv4
    while [[ -z "$khipv4" ]] || [[ !("$khipv4" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$) ]]
    do
        echo -e "\n${Red}Invalid value, Try again${Color_Off}"
        printf "${White}Kharej IPV4 : ${Color_Off}"
        read khipv4
    done
    printf "\n${White}Local IPV6 : ${Color_Off}"
    read loipv6
    while [[ -z "$loipv6" ]] || [[ !("$loipv6" =~ ^([0-9a-fa-f]{0,4}:){1,3}[0-9a-fa-f]{0,4}$) ]]
    do
        echo -e "\n${Red}Invalid value, Try again${Color_Off}"
        printf "${White}Local IPV6 : ${Color_Off}"
        read loipv6
    done
    myip=$(hostname -I | awk '{print $1}')
    if  grep -Fxq "#### START TUNNEL ####" /etc/rc.local
    then
        line_number=$(grep -n "#### START TUNNEL ####" /etc/rc.local)
        line_number=${line_number%:*}
        sed -i "$((line_number-1))d" /etc/rc.local
        sed -i "$((line_number-1))d" /etc/rc.local
        sed -i "$((line_number-1))d" /etc/rc.local
        sed -i "$((line_number-1))d" /etc/rc.local
        sed -i "$((line_number-1))d" /etc/rc.local
        sed -i "$((line_number-1))d" /etc/rc.local
        sed -i "$((line_number-1))d" /etc/rc.local
        oldfile=$(cat /etc/rc.local)
        rm -f /etc/rc.local
        echo '#! /bin/bash' >> /etc/rc.local
        echo '#### START TUNNEL ####' >> /etc/rc.local
        echo "sudo ip tunnel add parsabr mode sit remote $khipv4 local $myip ttl 255" >> /etc/rc.local
        echo 'sudo ip link set dev parsabr up' >> /etc/rc.local
        echo "sudo ip addr add $loipv6::1/64 dev parsabr" >> /etc/rc.local
        echo 'exit0' >> /etc/rc.local
        echo '#### END TUNNEL ####' >> /etc/rc.local
        echo "$oldfile" >> /etc/rc.local
    else
        oldfile=$(cat /etc/rc.local)
        rm -f /etc/rc.local
        echo '#! /bin/bash' >> /etc/rc.local
        echo '#### START TUNNEL ####' >> /etc/rc.local
        echo "sudo ip tunnel add parsabr mode sit remote $khipv4 local $myip ttl 255" >> /etc/rc.local
        echo 'sudo ip link set dev parsabr up' >> /etc/rc.local
        echo "sudo ip addr add $loipv6::1/64 dev parsabr" >> /etc/rc.local
        echo 'exit0' >> /etc/rc.local
        echo '#### END TUNNEL ####' >> /etc/rc.local
        echo "$oldfile" >> /etc/rc.local
    fi
    chmod +x /etc/rc.local
    sudo ip link set dev parsabr down
    sudo ip link delete parsabr
    /etc/rc.local
    printf "\n${Yellow}Do you want to install the x-ui (Tip : If you have x-ui, all its information will be deleted) ? (y/n) : ${Color_Off}"
    read installxui
    while [[ -z "$installxui" ]] || [[ !("$installxui" =~ ^[nNyY]+$) ]] || [[ ${#installxui} -gt 1 ]]
    do
        echo -e "\n${Red}Invalid value, Try again${Color_Off}"
        printf "${Yellow}Do you want to install the x-ui (Tip : If you have x-ui, all its information will be deleted) ? (y/n) : ${Color_Off}"
        read installxui
    done
    lowermup=$(echo "$installxui" | tr '[:upper:]' '[:lower:]')
    if [[ "$lowermup" == "y" ]]
    then
        if [[ -d /etc/x-ui ]]
        then
            filecreatetime=$(date "+%Y-%m-%d--%H-%M-%S")
            yes | cp -rf /etc/x-ui/x-ui.db /etc/x-ui/x-ui-backup-$filecreatetime.db
        else
            mkdir /etc/x-ui/
        fi
        wget -q https://raw.githubusercontent.com/saeidpour80/private/main/ir.db -O /etc/x-ui/x-ui.db
        echo "n" | bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh)
    fi
elif [[ $op -eq 2 ]]
then
    printf "\n${White}Iran IPV4 : ${Color_Off}"
    read iripv4
    while [[ -z "$iripv4" ]] || [[ !("$iripv4" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$) ]]
    do
        echo -e "\n${Red}Invalid value, Try again${Color_Off}"
        printf "${White}Iran IPV4 : ${Color_Off}"
        read iripv4
    done
    printf "\n${White}Local IPV6 : ${Color_Off}"
    read loipv6
    while [[ -z "$loipv6" ]] || [[ !("$loipv6" =~ ^([0-9a-fa-f]{0,4}:){1,3}[0-9a-fa-f]{0,4}$) ]]
    do
        echo -e "\n${Red}Invalid value, Try again${Color_Off}"
        printf "${White}Local IPV6 : ${Color_Off}"
        read loipv6
    done
    myip=$(hostname -I | awk '{print $1}')
    if  grep -Fxq "#### START TUNNEL ####" /etc/rc.local
    then
        line_number=$(grep -n "#### START TUNNEL ####" /etc/rc.local)
        line_number=${line_number%:*}
        sed -i "$((line_number-1))d" /etc/rc.local
        sed -i "$((line_number-1))d" /etc/rc.local
        sed -i "$((line_number-1))d" /etc/rc.local
        sed -i "$((line_number-1))d" /etc/rc.local
        sed -i "$((line_number-1))d" /etc/rc.local
        sed -i "$((line_number-1))d" /etc/rc.local
        sed -i "$((line_number-1))d" /etc/rc.local
        oldfile=$(cat /etc/rc.local)
        rm -f /etc/rc.local
        echo '#! /bin/bash' >> /etc/rc.local
        echo '#### START TUNNEL ####' >> /etc/rc.local
        echo "sudo ip tunnel add parsabr mode sit remote $iripv4 local $myip ttl 255" >> /etc/rc.local
        echo 'sudo ip link set dev parsabr up' >> /etc/rc.local
        echo "sudo ip addr add $loipv6::2/64 dev parsabr" >> /etc/rc.local
        echo 'exit0' >> /etc/rc.local
        echo '#### END TUNNEL ####' >> /etc/rc.local
        echo "$oldfile" >> /etc/rc.local
    else
        oldfile=$(cat /etc/rc.local)
        rm -f /etc/rc.local
        echo '#! /bin/bash' >> /etc/rc.local
        echo '#### START TUNNEL ####' >> /etc/rc.local
        echo "sudo ip tunnel add parsabr mode sit remote $iripv4 local $myip ttl 255" >> /etc/rc.local
        echo 'sudo ip link set dev parsabr up' >> /etc/rc.local
        echo "sudo ip addr add $loipv6::2/64 dev parsabr" >> /etc/rc.local
        echo 'exit0' >> /etc/rc.local
        echo '#### END TUNNEL ####' >> /etc/rc.local
        echo "$oldfile" >> /etc/rc.local
    fi
    chmod +x /etc/rc.local
    sudo ip link set dev parsabr down
    sudo ip link delete parsabr
    /etc/rc.local
    if [[ -d /etc/x-ui ]]
    then
        filecreatetime=$(date "+%Y-%m-%d--%H-%M-%S")
        yes | cp -rf /etc/x-ui/x-ui.db /etc/x-ui/x-ui-backup-$filecreatetime.db
    else
        mkdir /etc/x-ui/
    fi
    wget -q https://raw.githubusercontent.com/saeidpour80/private/main/kh.db -O /etc/x-ui/x-ui.db
    echo "n" | bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh)
fi