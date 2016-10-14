# Install git
sudo apt-get update
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
mysql -u $DB_USER -p$DB_PASS < /home/vagrant/shack.sql

# install node
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y -qq nodejs

# Enable node service
cp /home/vagrant/shack.service /etc/systemd/system/shack.service
systemctl enable shack.service
