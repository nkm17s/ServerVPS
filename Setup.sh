sudo useradd -m $3
sudo adduser $3 sudo
echo $3:$4 | sudo chpasswd
sudo sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
sudo hostname $2
wget -O ngrok.tgz https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
tar -xf ngrok.tgz
chmod +x ./ngrok
echo -e $4\n$4 | sudo passwd "$USER"
rm -f .ngrok.log
./ngrok authtoken $1
./ngrok tcp 22 --log ".ngrok.log" &
sleep 10
sudo apt-get install micro -y
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sudo sed -i 's/#Port 22/Port 168/g' /etc/ssh/sshd_config
sudo sed -i 's/5222/52xx/g' /etc/services
sudo sed -i 's/22125/xx125/g' /etc/services
sudo sed -i 's/22128/xx128/g' /etc/services
sudo sed -i 's/22273/xx273/g' /etc/services
sudo sed -i 's/22/168/g' /etc/services
sudo sed -i 's/52xx/5222/g' /etc/services
sudo sed -i 's/xx125/22125/g' /etc/services
sudo sed -i 's/xx128/22128/g' /etc/services
sudo sed -i 's/xx273/22273/g' /etc/services
sudo apt install ufw -y
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw enable
systemctl restart ssh
sudo apt-get clean
