# Stop everything, remove built containers and rebuild.
set -e
sudo fig kill
sudo fig rm --force
sudo fig build
