# Configure Rails to use the linked Postgres container in the production
# environment.
require 'yaml'
database_config = YAML.load(File.open("config/database.yml"))
database_config['production']['database'] = "<%= ENV.fetch('FUGACIOUS_DATABASE') %>"
database_config['production']['username'] = "<%= ENV.fetch('FUGACIOUS_USERNAME') %>"
database_config['production']['host'] = "<%= ENV.fetch('PG_1_PORT_5432_TCP_ADDR') %>"
database_config['production']['port'] = "<%= ENV.fetch('PG_1_PORT_5432_TCP_PORT') %>"
File.open("config/database.yml", "w") {|f| f.write(database_config.to_yaml) }

secret_config = YAML.load(File.open("config/secrets.yml"))
secret_config['production']['secret_key_base'] = "<%= ENV.fetch('FUGACIOUS_SECRET_KEY_BASE') %>"
secret_config['production']['db_key_base'] = "<%= ENV.fetch('FUGACIOUS_DB_KEY_BASE') %>"
File.open("config/secrets.yml", "w") {|f| f.write(secret_config.to_yaml) }
