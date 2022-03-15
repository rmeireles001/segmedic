O Super Usuário (Ou Administrador) vem desabilidado por padrão. Para habilitar, digite o seguinte comando:

$ sudo passwd root

Será primeiramente solicitada a senha de usuário configurado (segmedic123)
Depois será solicitada a nova senha do SU
Confirme a senha digitando novamente

Depois é necessário remover as permissões do usuário:
Entre como su:

$ su

Digite a senha do SU

Entre com os dois comandos

# sudo deluser $USER sudo 
# sudo gpasswd -d $USER sudo

Reinicie a máquina

Depois atualizar os pacotes

$ su
# apt update
# apt upgrade

Agora vamos criar um script que montará automaticamente a pasta do .11

Primeiramente crie a pasta onde a pasta compartilhada será montada.

# mkdir /mnt/fileserver

Vá para a pasta documentos:

# cd /home/$USER/Documentos

Para acessar a pasta na rede (//192.168.11.11)

crie um novo arquivo digitando:

# nano uso_ti.sh

cole no arquivo as duas linhas abaixo:

#!/bin/bash
mount -t cifs //192.168.11.11/d /mnt/fileserver -o user=administrator,password=,dir_mode=0777,file_mode=0777

feche e salvo o arquivo

Mude as permissões:

# chmod o=r uso_ti.sh
# chmod u=x uso_ti.sh

rode o arquivo:

./uso_ti.sh

Acesse a pasta do .11 (Opcional)

# cd /mnt/fileserver

Para instalar o chrome:

# cd /mnt/fileserver/PROGRAMAS/Navegador
# dpkg -i nome_do_pacote.deb

Obs: O instalador do google chrome tem o formato .deb quando for digitar o nome do pacote, basta digitar as primeiras letras e autocompletar com tab no teclado.

O google chrome só aparece disponível no iniciar depois de encerrar a sessão ou reiniciar

Para instalar o teamviewer host

# cd /mnt/fileserver/PROGRAMAS/Acesso_remoto/TeamViewer_Host
# dpkg -i nome_do_pacote.deb

Provavelmente ocorrerão erros, então rode o seguinte comando para corrigir:

# apt --fix-broken install 
