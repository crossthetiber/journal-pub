#!/bin/sh
set -e

echo "Add github token so we can pull from private repos"
sudo -u app git config --global url."https://api:$OAUTHTOKEN@github.com/".insteadOf "https://github.com/"
sudo -u app git config --global url."https://ssh:$OAUTHTOKEN@github.com/".insteadOf "ssh://git@github.com/"
sudo -u app git config --global url."https://git:$OAUTHTOKEN@github.com/".insteadOf "git@github.com:"

echo "Not sure why but bundle install has to be done again otherwise app complains about hesburgh_assets not checked out"
cd $APP_DIR
sudo -u app bundle install

echo "Create symlinks"
ln -s $APP_DIR/shared/data/cache $APP_DIR/tmp/cache
ln -s /mnt/freshwriting/system $APP_DIR/public/system

echo "Create template files"
cp "$APP_DIR/config/secrets.yml.example" "$APP_DIR/config/secrets.yml"
cp "$APP_DIR/config/database.yml.example" "$APP_DIR/config/database.yml"
cp "$APP_DIR/config/initializers/devise_secret.yml.example" "$APP_DIR/config/initializers/devise_secret.yml"


echo "Modify config file for database"
sed -i 's/{{ database_host }}/'"$DB_HOST"'/g' "$APP_DIR/config/database.yml"
sed -i 's/{{ database_username }}/'"$DB_USER"'/g' "$APP_DIR/config/database.yml"
sed -i 's/{{ database_password }}/'"$DB_PASSWORD"'/g' "$APP_DIR/config/database.yml"
sed -i 's/{{ database_name }}/'"$DB_NAME"'/g' "$APP_DIR/config/database.yml"

echo "Modify config file for secrets"
sed -i 's/{{ auth_server_id }}/'"$AUTH_SERVER_ID"'/g' "$APP_DIR/config/secrets.yml"
sed -i 's/{{ client_id }}/'"$CLIENT_ID"'/g' "$APP_DIR/config/secrets.yml"
sed -i 's/{{ client_secret }}/'"$CLIENT_SECRET"'/g' "$APP_DIR/config/secrets.yml"
sed -i 's/{{ secret_key_base }}/'"$SECRET_KEY_BASE"'/g' "$APP_DIR/config/secrets.yml"
sed -i 's/{{ host_name }}/'"$HOST_NAME"'/g' "$APP_DIR/config/secrets.yml"

echo "Modify config file for devise_secret"
sed -i 's/{{ secret_key_base }}/'"$SECRET_KEY_BASE"'/g' "$APP_DIR/config/initializers/devise_secret.yml"

echo "Modify webapp config file for PASSENGER_APP_ENV setting"
sed -i 's/{{ passenger_app_env }}/'"$PASSENGER_APP_ENV"'/g' "/etc/nginx/sites-enabled/webapp.conf"

chown -R app:app /mnt/freshwriting

echo "Run the assets rake job"
sudo -u app RAILS_ENV=$PASSENGER_APP_ENV bundle exec rake assets:precompile

echo "Perform indexing"
sudo -u app RAILS_ENV=$PASSENGER_APP_ENV bundle exec rake sunspot:reindex

echo "Start Passenger Service as $PASSENGER_APP_ENV"
exec /sbin/my_init
