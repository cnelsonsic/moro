while :
do
  echo "Trying to launch..." >> /var/log/user-data.log
  /etc/lxdm/automount.sh
  DISPLAY=:0 /media/app/launcher 2>&1 >> /var/log/user-data.log || timeout 5s feh /vagrant/images/nocart.png
done
