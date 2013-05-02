export DISPLAY=:0
xrandr --size 640x480
feh --bg-scale /vagrant/images/wait.png
echo "Finished prelogin.sh" >> /var/log/user-data.log
