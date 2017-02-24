source /vagrant/env-vars.sh

# Update repos
sudo apt-get update

# Install git
sudo apt-get install -y -qq git

# Install mysql
export DEBIAN_FRONTEND="noninteractive"

sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $DB_PASS"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $DB_PASS"

sudo debconf-set-selections <<< "mysql-community-server mysql-community-server/data-dir select ''"
sudo debconf-set-selections <<< "mysql-community-server mysql-community-server/root-pass password $DB_PASS"
sudo debconf-set-selections <<< "mysql-community-server mysql-community-server/re-root-pass password $DB_PASS"

sudo apt-get install -y -qq mysql-server mysql-client

#mysql_secure_installation

# configure mysql
mysql -u $DB_USER -p$DB_PASS < /vagrant/shack.sql
mysql -u $DB_USER -p$DB_PASS shack < /vagrant/data.sql

# install node
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y -qq nodejs

# Enable node service
cp /vagrant/shack.service /etc/systemd/system/shack.service
sudo systemctl enable shack.service
