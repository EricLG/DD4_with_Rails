
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
Les paquets server-dev et libpq-dev sont pour éviter une erreur lors du bundle install sur la gem pg
sudo apt-get install postgresql_9.6 postgresql-server-dev-9.6 libpq-dev
sudo apt-get install pgadmin3

cd dossier DD4
bundle install
rbenv rehash
rails -v

Créer le superuser illisae et le superuser de prod dans postgres.
sudo su postgres
createuser illisae -P --interactive
createuser <prod_user> -P --interactive

Rajouter dans le bashRC les variables d'environnements suivantes :
SECRET_KEY_BASE avec la valeur de rake secret
DD4_DATABASE_USERNAME
DD4_DATABASE_PASSWORD
RAILS_SERVE_STATIC_FILES = true

Modifier un fichier pg :
vim /etc/postgresql/9.6/main/pg_hba.conf
(un local en md5)
sudo service postgresql restart

Créer la base de prod
RAILS_ENV=production rake db:create db:migrate db:seed
