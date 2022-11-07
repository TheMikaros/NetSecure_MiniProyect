#!/bin/bash
# This script may be created and modified by Mikaros

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

#   Instalacion y configuracion de Tor

echo "$(tput setaf 2)                          
                           ..         
                          ,:          
                  .      ::           
                  .:    :2.           
                   .:,  1L            
                    .v: Z, ..::,      
                     :k:N.Lv:         
                      22ukL           
                      JSYk.$(tput bold ; tput setaf 7)           
                     ,B@B@i           
                     BO@@B@.          
                   :B@L@Bv:@7         
                 .PB@iBB@  .@Mi       
               .P@B@iE@@r  . 7B@i     
              5@@B@:NB@1$(tput setaf 5) r  ri:$(tput bold ; tput setaf 7)7@M    
            .@B@BG.OB@B$(tput setaf 5)  ,.. .i, $(tput bold ; tput setaf 7)MB,  
            @B@BO.B@@B$(tput setaf 5)  i7777,    $(tput bold ; tput setaf 7)MB. 
           PB@B@.OB@BE$(tput setaf 5)  LririL,.L. $(tput bold ; tput setaf 7)@P 
           B@B@5iB@B@i$(tput setaf 5)  :77r7L, L7 $(tput bold ; tput setaf 7)O@ 
           @B1B27@B@B,$(tput setaf 5) . .:ii.  r7 $(tput bold ; tput setaf 7)BB 
           O@.@M:B@B@:$(tput setaf 5) v7:    ::.  $(tput bold ; tput setaf 7)BM 
           :Br7@L5B@BO$(tput setaf 5) irL: :v7L. $(tput bold ; tput setaf 7)P@, 
            7@,Y@UqB@B7$(tput setaf 5) ir ,L;r: $(tput bold ; tput setaf 7)u@7  
             r@LiBMBB@Bu$(tput setaf 5)   rr:.$(tput bold ; tput setaf 7):B@i   
               FNL1NB@@@@:   ;OBX     
                 rLu2ZB@B@@XqG7$(tput sgr0 ; tput setaf 2)      
                    . rJuv::          
                             
    
"

echo "$(tput setaf 6) Instalacion y Configuración de Access Point con Onion Tor proxy.$(tput sgr0)"
read -p "$(tput bold ; tput setaf 2)Pressiona [Enter] para comenzar, [Ctrl-C] para cancelar...$(tput sgr0)"

#   Instalamos Tor

echo "$(tput setaf 6)Instalando Tor...$(tput sgr0)"
apt-get install tor -y

echo "$(tput setaf 6)Configurando  Tor...$(tput sgr0)"

#Hacemos un backup de congfiguraciones previas

cp /etc/tor/torrc /etc/tor/torrc.bak
echo "Log notice file /var/log/tor/notices.log
VirtualAddrNetwork 10.192.0.0/10
AutomapHostsSuffixes .onion,.exit
AutomapHostsOnResolve 1
TransPort 192.168.4.1:9040
DNSPort 192.168.4.1:53" >> /etc/tor/torrc

#   Limpiamos Configuracion anteriores de las IPtables
#   para realizar un bridge con la red Tor

echo "$(tput setaf 6)Eliminamos antiguas IP tables...$(tput sgr0)"

iptables -F
iptables -t nat -F

echo -n "$(tput setaf 6)Establecemos una excepción de $(tput bold)ssh$(tput sgr0 ; tput setaf 6) en el puerto 22...$(tput sgr0)"
sleep .5
echo -n "$(tput setaf 6). "
sleep .5
echo -n "$(tput setaf 6). "
sleep .5
echo "$(tput setaf 6). "
sleep .5

iptables -t nat -A PREROUTING -i wlan0 -p tcp --dport 22 -j REDIRECT --to-ports 22

echo -n "$(tput setaf 6)Redireccionamiento del trafico DNS...$(tput sgr0)"
sleep .5
echo -n "$(tput setaf 6). "
sleep .5
echo -n "$(tput setaf 6). "
sleep .5
echo "$(tput setaf 6). "
sleep .5

iptables -t nat -A PREROUTING -i wlan0 -p udp --dport 53 -j REDIRECT --to-ports 53

echo -n "$(tput setaf 6)Redireccionamiento del trafico TCP$(tput sgr0)"
sleep .5
echo -n "$(tput setaf 6). "
sleep .5
echo -n "$(tput setaf 6). "
sleep .5
echo "$(tput setaf 6). "
sleep .5

iptables -t nat -A PREROUTING -i wlan0 -p tcp --syn -j REDIRECT --to-ports 9040

echo -n "$(tput setaf 6)Guardamos IP tables$(tput sgr0)"
sleep .5
echo -n "$(tput setaf 6). "
sleep .5
echo -n "$(tput setaf 6). "
sleep .5
echo "$(tput setaf 6). "
sleep .5

sh -c "iptables-save > /etc/iptables.ipv4.nat"

#   Creamos archivos de Tor para Logs

echo -n "$(tput setaf 6)Estableciendo log's en /var/log/tor/notices.log$(tput sgr0)"
sleep .5
echo -n "$(tput setaf 6). "
sleep .5
echo -n "$(tput setaf 6). "
sleep .5
echo "$(tput setaf 6). "
sleep .5

touch /var/log/tor/notices.log
chown debian-tor /var/log/tor/notices.log
chmod 644 /var/log/tor/notices.log

#   Eliminamos el archivo del servicio de tor

rm /usr/lib/systemd/system/tor.service

echo "[Unit]
Description=Anonymizing Overlay Network
#After=network.target

[Service]
Type=simple
#ExecStart=/usr/bin/tor -f /etc/tor/torrc
RemainAfterExit=yes
ExecStart=/bin/true
ExecReload=/bin/true
KillSignal=SIGINT
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target" >> /usr/lib/systemd/system/tor.service

#   recargamos los daemos para poder aplicar nuestra configuracion 
systemctl daemon-reload

echo "$(tput setaf 6)Inicializando Tor...$(tput sgr0)"
service tor start

echo -n  "$(tput setaf 6)Añadir el arranque automático de Tor al iniciar la Raspberry Pi boot$(tput sgr0)"
sleep .5
echo -n "$(tput setaf 6). "
sleep .5
echo -n "$(tput setaf 6). "
sleep .5
echo "$(tput setaf 6). "
sleep .5

update-rc.d tor enable

echo "$(tput setaf 6)Configuracion completa!

$(tput bold)Verificar Funcionamiento en : $(tput setaf 3)https://check.torproject.org/ $(tput sgr0)"


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