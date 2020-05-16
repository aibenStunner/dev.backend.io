cd /
cd home/pi/
sleep 5
./ngrok start --all --config=/home/pi/.ngrok2/ngrok.yml
sleep 5
sudo python3 postURLs.py
