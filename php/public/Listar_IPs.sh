#/bin/bash
REGEX='^([1-9][0-9]?|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.([0-9][0-9]?\.|1[0-9]{2}\.|2[0-4][0-9]\.|25[0-5]\.){2}([0-9][0-9]?|1[0-9]{2}|2[0-4][0-9]|25[0-4])'
clear;
x=1;
while (($x<=5));do
read -p "Informe o $xº IP: ";
	if grep -Eq "$REGEX" <<< "$REPLY";then
	echo "$REPLY" >> LISTA_IP.txt;
	let x++;
	else echo "IP: ${REPLY} não é válido";
	fi;
done
clear
awk 'BEGIN{printf "\nLista de IPs Informados:\n\n"}{printf "IP Nº %02d => %s\n" ,NR,$0}' LISTA_IP.txt 
