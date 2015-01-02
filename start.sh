# Perform the initial db migration and up the services.
set -e
sudo fig run app rake db:migrate
sudo fig up
