# Set environment variables
echo "export OPENSHIFT_MYSQL_DB_HOST=localhost" > /home/vagrant/vars.sh
echo "export DB_USER=root" >> /home/vagrant/vars.sh
echo "export DB_PASS=password" >> /home/vagrant/vars.sh
echo "export NODE_IP=0.0.0.0" >> /home/vagrant/vars.sh
echo "export JWT_SECRET=secret" >> /home/vagrant/vars.sh
source /home/vagrant/vars.sh

# Install git
sudo apt-get install -y -qq git

# Install mysql
export DEBIAN_FRONTEND="noninteractive"

sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $DB_PASS"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $DB_PASS"

sudo debconf-set-selections <<< "mysql-community-server mysql-community-server/data-dir select ''"
sudo debconf-set-selections <<< "mysql-community-server mysql-community-server/root-pass password $DB_PASS"
sudo debconf-set-selections <<< "mysql-community-server mysql-community-server/re-root-pass password $DB_PASS"

sudo apt-get install -y -qq mysql-server-5.5 mysql-client

#mysql_secure_installation

# configure mysql
mysql -u $DB_USER -p$DB_PASS shack < /home/vagrant/shack.sql

# install node
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y -qq nodejs
