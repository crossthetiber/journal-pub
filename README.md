# Fresh Writing

## Development setup

### Requirements:
1. Ruby 2.4.1 `rbenv install 2.4.1`
2. Bundler: `gem install bundler -v 1.17.3`
3. MySQL:
  * `brew install mysql`
  * `gem install mysql2 -v '0.4.10' -- --with-ldflags=-L/usr/local/opt/openssl/lib --with-cppflags=-I/usr/local/opt/openssl/include`
4. OpenSSL: `brew install openssl@1.0`
5. ImageMagick: ` brew install imagemagick`

Run the following commands to get the application running in development.  This assumes the root mysql account is passwordless and has permission to create databases.

### Configuration
Before running copy and configure `/config/database.example.yml` -> `/config/database.yml` and `/config/secrets.examples.yml` -> `/config/secrets.yml`

### Commands
```
export RAILS_ENV=development
export SSL=true
bundle
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:test:prepare
bundle exec rake db:seed
bundle exec rake sunspot:solr:start
SSL=true bundle exec rails s
```

1. Starts a development server on port 3000: https://localhost:3000
2. Starts a local instance of solr on port 8080: http://localhost:8080/solr/#/
3. Monitors files for changes and automatically runs relevant tests (press enter to run the full test suite)

### Notes
* [Multimedia notes](https://docs.google.com/document/d/1C3fcb-7cGk6r3-JU3XNJCJnCzJvSplKmJ0pfnKCguTY/edit)


## Docker/Fargate
In October 2022, the FreshWriting service was moved fully into a Docker container and out to AWS Fargate. Following the pattern used in several other Ruby on Rails applications, the service was upgraded to Ruby 2.7.4 and Docker configuration files were added to the repository to allow for containerization and deployment.

A CICD pipeline was created which will automatically update/create a test service when changes are made. This pipeline, and the corresponding ECS Cluster can be found in the Libraries' AWS account

NOTE: The AWS deployment code for this service can be found in the repository:

__freshwriting-blueprints-cdk__
