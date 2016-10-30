echo "Ignore that 'ttyname failed' message"
# start server
cd /home/ubuntu/shack
npm install --loglevel=error

echo "Starting server..."
systemctl start shack.service

echo "It's vagrant o'clock and all's well"
