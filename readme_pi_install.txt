
  Install RASPBERRY

Changer de user :
https://www.raspberrypi.org/documentation/linux/usage/users.md

Suivre https://gorails.com/setup/windows/10
sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev
Installer RBENV
Tester RBENV :
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
Si OK, installer la derniere version ruby 2.3
rbenv install -l | grep 2.3
rbenv install 2.3.6

Si probleme opensssl :
apt-get install libssl1.0-dev
rbenv install 2.3.6
rbenv rehash
rbenv global 2.3.6
ruby -v

gem install bundler
Créer une clé ssh (cf github)
git clone DD4

POSTGRES:
sudo apt-get install postgresql_9.6
sudo apt-get install pgadmin3

cd dossier DD4
bundle install
Erreur pg
=> you need to install postgresql-server-dev-9.6 for server and libpq-dev for client

Créer le superuser illisae dans postgres
sudo su postgres
createuser illisae -P --interactive
