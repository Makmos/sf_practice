#!/usr/bin/env bash

  sleep 10
  sudo apt update
  sudo apt -y upgrade
  sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
  sudo apt update
  sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install postgresql-8.4
  sudo sed -i "/listen/s/\#listen_addresses\ =\ 'localhost'/listen_addresses = '*'/g" /etc/postgresql/8.4/main/postgresql.conf
  sudo systemctl restart postgresql
  sudo apt install -y python3 python3-pip
  sudo pip3 install django
  sudo apt install  -y libpq-dev
  sudo pip3 install psycopg2
