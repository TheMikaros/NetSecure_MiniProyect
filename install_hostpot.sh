#!/bin/bash
# This script may be created and modified by Mikaros 
# But mainly fixed by Raspberry Pi B 4 MX...

#  Verificamos ejecucion con Root para evitar problemas al intalar, modificar y crear archivos
if (( $EUID != 0 )); then 
   echo "Este Script debe ser ejecutado como root. Escriba 'sudo bash $0' para ejecutarlo como root" 
   exit 1 
fi

#   Portada
echo "
$(tput setaf 6)         Benemérita Universidad Autónoma de Aguascalientes$(tput sgr0)
            $(tput setaf 15) .........................................
            $(tput setaf 15) .                                       .
            $(tput setaf 15) .$(tput setaf 21)     ||||$(tput setaf 15).$(tput setaf 105)|        |||||||||$(tput setaf 15).$(tput setaf 21)|         $(tput setaf 15).
            $(tput setaf 15) .$(tput setaf 21)      |||$(tput setaf 15).$(tput setaf 105)||         |||||||$(tput setaf 15).$(tput setaf 21)||        $(tput setaf 15).
            $(tput setaf 15) .$(tput setaf 21)      |||$(tput setaf 15).$(tput setaf 105)|||            ||||$(tput setaf 15).$(tput setaf 21)||       $(tput setaf 15).
            $(tput setaf 15) .$(tput setaf 21)      |||$(tput setaf 15).$(tput setaf 105)||||       $(tput setaf 221)-$(tput setaf 105)   ||||$(tput setaf 15).$(tput setaf 21)|||      $(tput setaf 15).
            $(tput setaf 15) .$(tput setaf 21)      |||$(tput setaf 15).$(tput setaf 105)||||     $(tput setaf 221)--$(tput setaf 15).$(tput setaf 1)~$(tput setaf 105)  ||||$(tput setaf 15).$(tput setaf 21)|||      $(tput setaf 15).
            $(tput setaf 15) .$(tput setaf 21)      |||$(tput setaf 15).$(tput setaf 105)||||   $(tput setaf 221)----$(tput setaf 15).$(tput setaf 1)~~$(tput setaf 105) ||||$(tput setaf 15).$(tput setaf 21)|||      $(tput setaf 15).
            $(tput setaf 15) .$(tput setaf 21)      |||$(tput setaf 15).$(tput setaf 105)|||| $(tput setaf 221)----$(tput setaf 15).$(tput setaf 1)~~~~$(tput setaf 105) ||||$(tput setaf 15).$(tput setaf 21)|||      $(tput setaf 15).
            $(tput setaf 15) .$(tput setaf 21)      |||$(tput setaf 15).$(tput setaf 105)|||| $(tput setaf 221)--$(tput setaf 15).$(tput setaf 1)~~~~$(tput setaf 105)   ||||$(tput setaf 15).$(tput setaf 21)|||      $(tput setaf 15).
            $(tput setaf 15) .$(tput setaf 21)      |||$(tput setaf 15).$(tput setaf 105)|||| $(tput setaf 221)-$(tput setaf 15).$(tput setaf 1)~~$(tput setaf 105)      ||||$(tput setaf 15).$(tput setaf 21)|||      $(tput setaf 15).
            $(tput setaf 15) .$(tput setaf 21)      |||$(tput setaf 15).$(tput setaf 105)|||| $(tput setaf 1) ~$(tput setaf 105)        ||||$(tput setaf 15).$(tput setaf 21)|||      $(tput setaf 15).
            $(tput setaf 15) .$(tput setaf 21)       ||$(tput setaf 15).$(tput setaf 105)||||            |||$(tput setaf 105).$(tput setaf 21)|||      $(tput setaf 15).
            $(tput setaf 15) .$(tput setaf 21)        ||$(tput setaf 15).$(tput setaf 105)|||||||         ||$(tput setaf 105).$(tput setaf 21)|||      $(tput setaf 15).
            $(tput setaf 15) .$(tput setaf 21)         |$(tput setaf 15).$(tput setaf 105)|||||||||        |$(tput setaf 105).$(tput setaf 21)||||     $(tput setaf 15).
            $(tput setaf 15) .                                       .
            $(tput setaf 15) .........................................
    "
echo "
$(tput setaf 6) NetSecure: Integración de dispositivos de Internet de las Cosas (IoT)
        para la creación de redes móviles de navegación segura con 
                mecanismos de ciberseguridad$(tput sgr0)
    
        $(tput setaf 15)-------------------------------------------------------
   	$(tput setaf 15)    CCBAS                         
   	$(tput setaf 15)                 MiniProyecto 2022    
	$(tput setaf 15)        
   	$(tput setaf 15)    Profesores Responsables:         
   	$(tput setaf 15)            Luis Eduardo Bautista Villalpando, PhD.      	
	$(tput setaf 15)            Dra. Estela Lizbeth Muñoz Andrade
	$(tput setaf 15)    Profesor Corresponsal:       
	$(tput setaf 15)            Dr. Arturo Elías Ramírez
	$(tput setaf 15)    Estudiante:   
	$(tput setaf 15)            Marco Antonio Aguayo Garza         	
   	$(tput setaf 15)-------------------------------------------------------
   	$(tput setaf 15)                                            Version 1.0

"

read -p "$(tput bold ; tput setaf 2)Pressiona [Enter] para continuar, [Ctrl-C] para cancelar...$(tput sgr0)"

#   Instalacion y configuracion de ACCESS POINT

echo "      
        $(tput setaf 2)              .~~.   .~~.
        $(tput setaf 6)   /         $(tput setaf 2)'. \ ' ' / .'$(tput setaf 6)         \ 
        $(tput setaf 6)  |   /       $(tput setaf 1).~ .~~~..~.$(tput setaf 6)       \   |
        $(tput setaf 6) |   |   /  $(tput setaf 1) : .~.'~'.~. :$(tput setaf 6)   \   |   |
        $(tput setaf 6)|   |   |   $(tput setaf 1)~ (   ) (   ) ~$(tput setaf 6)   |   |   |
        $(tput setaf 6)|   |  |   $(tput setaf 1)( : '~'.~.'~' : )$(tput setaf 6)   |  |   |
        $(tput setaf 6)|   |   |   $(tput setaf 1)~ .~ (   ) ~. ~ $(tput setaf 6)  |   |   |
        $(tput setaf 6) |   |   \   $(tput setaf 1)(  : '~' :  )$(tput setaf 6)   /   |   |
        $(tput setaf 6)  |   \       $(tput setaf 1)'~ .~~~. ~'$(tput setaf 6)       /   |
        $(tput setaf 6)   \              $(tput setaf 1)'~'$(tput setaf 6)              / 

"
#   Mensaje de confirmacion para continurar con el proceso

echo "$(tput setaf 6)Este script va a configurar tu Raspberry Pi como un Punto de acceso Wifi.$(tput sgr0)"
read -p "$(tput bold ; tput setaf 2)Pressiona [Enter] para comenzar, [Ctrl-C] para cancelar...$(tput sgr0)"

echo -n "$(tput setaf 6)Actualizando las paqueterías$(tput sgr0)"
sleep .5
echo -n "$(tput setaf 6). $(tput sgr0)"
sleep .5
echo -n "$(tput setaf 6). $(tput sgr0)"
sleep .5
echo "$(tput setaf 6). $(tput sgr0)"
sleep .5

#   Actulizamos pakages 

apt-get update -y

echo -n "Instalando dnsmasq"
sleep .5
echo -n "$(tput setaf 6). $(tput sgr0)"
sleep .5
echo -n "$(tput setaf 6). $(tput sgr0)"
sleep .5
echo "$(tput setaf 6). $(tput sgr0)"
sleep .5

#   Instalamos dnsmasq el cual nos servira para asignar ip a los usarios
#   que se conecten al AP

apt install dnsmasq -y
systemctl stop dnsmasq

#   Establecemos una direccion estatica para la interfaz de red wlan0

echo -n "Configurando Wlan0 con una IP Statica: 192.168.42.1/24  "
sleep .5
echo -n "$(tput setaf 6). $(tput sgr0)"
sleep .5
echo -n "$(tput setaf 6). $(tput sgr0)"
sleep .5
echo "$(tput setaf 6). $(tput sgr0)"
sleep .5

echo "interface wlan0
    static ip_address=192.168.4.1/24
    nohook wpa_supplicant" >> /etc/dhcpcd.conf

echo -n "Reiniciando dhcpcd"
sleep .5
echo -n "$(tput setaf 6). $(tput sgr0)"
sleep .5
echo -n "$(tput setaf 6). $(tput sgr0)"
sleep .5
echo "$(tput setaf 6). $(tput sgr0)"
sleep .5

service dhcpcd restart

#   Configguramos dnsmasq para poder asignar direcciones IP a los host
#   que se conecten

echo -n "Configurando dnsmasq"
sleep .5
echo -n "$(tput setaf 6). $(tput sgr0)"
sleep .5
echo -n "$(tput setaf 6). $(tput sgr0)"
sleep .5
echo "$(tput setaf 6). $(tput sgr0)"
sleep .5

mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig

echo "interface=wlan0      # Use the require wireless interface - usually wlan0
dhcp-range=192.168.4.2,192.168.4.20,255.255.255.0,24h" > /etc/dnsmasq.conf

echo -n "Activando dnsmasq"
sleep .5
echo -n "$(tput setaf 6). $(tput sgr0)"
sleep .5
echo -n "$(tput setaf 6). $(tput sgr0)"
sleep .5
echo "$(tput setaf 6). $(tput sgr0)"
sleep .5

systemctl unmask dnsmasq
systemctl enable dnsmasq

echo -n "Reiniciando dnsmasq"
sleep .5
echo -n "$(tput setaf 6). $(tput sgr0)"
sleep .5
echo -n "$(tput setaf 6). $(tput sgr0)"
sleep .5
echo "$(tput setaf 6). $(tput sgr0)"
sleep .5

systemctl restart dnsmasq

# Liberamos el soft lock, no siempre se bloquea

echo -n "Desbloqueo de wlan soft lock con rfkill"
sleep .5
echo -n "$(tput setaf 6). $(tput sgr0)"
sleep .5
echo -n "$(tput setaf 6). $(tput sgr0)"
sleep .5
echo "$(tput setaf 6). $(tput sgr0)"
sleep .5

if ! command -v rfkill &> /dev/null; then
    rfkill unblock wlan
fi

echo -n "Instalando hostapd"
sleep .5
echo -n "$(tput setaf 6). $(tput sgr0)"
sleep .5
echo -n "$(tput setaf 6). $(tput sgr0)"
sleep .5
echo "$(tput setaf 6). $(tput sgr0)"
sleep .5

#   Instalamos hostapd para facilitar el uso del adaptador de red como AP

apt-get install hostapd -y
systemctl unmask hostapd

echo -n  "Activando hostapd"
sleep .5
echo -n "$(tput setaf 6). $(tput sgr0)"
sleep .5
echo -n "$(tput setaf 6). $(tput sgr0)"
sleep .5
echo "$(tput setaf 6). $(tput sgr0)"
sleep .5

systemctl enable hostapd

#   Configuramos nuestra red, Nombre y contrasenia 

echo "Configurando Hostapd !"
echo "Escoge el nombre de tu red (1-32 caracteres, Intenta usar caracteres especiales ASCII ) : "
read ssid

echo "Escoge la contraseña de tu red  (Almenos 8 caracteres): "
read passphrase

echo -n "Estableciendo parámetros "
sleep .5
echo -n "$(tput setaf 6). $(tput sgr0)"
sleep .5
echo -n "$(tput setaf 6). $(tput sgr0)"
sleep .5
echo "$(tput setaf 6). $(tput sgr0)"
sleep .5

#   Creamos el archivo /etc/hostapd/hostpad.conf con las siguientes configuracion
#   incluyendo el nombre de red y contraseña, proporcionados

echo "interface=wlan0
driver=nl80211
ssid=$ssid
hw_mode=g
channel=7
wmm_enabled=0
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
wpa=2
wpa_passphrase=$passphrase
wpa_key_mgmt=WPA-PSK
wpa_pairwise=TKIP
rsn_pairwise=CCMP
" > /etc/hostapd/hostapd.conf

echo 'DAEMON_CONF="/etc/hostapd/hostapd.conf"' >> /etc/default/hostapd

echo -n  "$(tput setaf 6) Inicializando hostapd"
sleep .5
echo -n "$(tput setaf 6). "
sleep .5
echo -n "$(tput setaf 6). "
sleep .5
echo "$(tput setaf 6). "
sleep .5

systemctl start hostapd

echo "$(tput setaf 6)Configurar el reenvío de IP para que se inicie en el arranque del sistema$(tput sgr0)"
sleep .5
echo -n "$(tput setaf 0). $(tput sgr0)"
sleep .5
echo -n "$(tput setaf 0). $(tput sgr0)"
sleep .5
echo "$(tput setaf 0). $(tput sgr0)"
sleep .5

cp /etc/sysctl.conf /etc/sysctl.bak
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf

echo "up iptables-restore < /etc/iptables.ipv4.nat" >> /etc/network/interfaces

echo "$(tput setaf 6)Activación del reenvío de IP...$(tput sgr0)"
sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"

#   Creamos un bridge entre ethernet y wifi

echo "$(tput setaf 6)Configuración de tablas IP para interconectar puertos...$(tput sgr0)"
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT

echo "$(tput setaf 6)Guardando IP tables...$(tput sgr0)"
sh -c "iptables-save > /etc/iptables.ipv4.nat"

#   Configuramos el autoarranque 

echo "Añadir el arranque automático al iniciar la Raspberry Pi."
sed -i '/exit 0/ i iptables-restore < /etc/iptables.ipv4.nat' /etc/rc.local

echo "$(tput setaf 6)Instalacion completa!"


echo -n  "$(tput setaf 6)Reiniciando$(tput sgr0)"
sleep .5
echo -n "$(tput setaf 6). "
sleep .5
echo -n "$(tput setaf 6). "
sleep .5
echo "$(tput setaf 6). "
sleep .5

reboot

exit 0