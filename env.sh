# These variables should be self- explanatory, the official postgres image
# creates a user and database with the same name hence $POSTGRES_USER
# being passed to in both intances.

export POSTGRES_PASSWORD=mysecretpassword
export POSTGRES_USER=fugacious
export FUGACIOUS_USERNAME=$POSTGRES_USER
export FUGACIOUS_DATABASE=$POSTGRES_USER
export FUGACIOUS_DATABASE_PASSWORD=$POSTGRES_PASSWORD
export RAILS_ENV=production


# Use 'rake secret' to generate each of these secure keys.

export FUGACIOUS_SECRET_KEY_BASE=onesecuresecret
export FUGACIOUS_DB_KEY_BASE=twosecuresecret
export GOOGLE_AUTH_PROXY_COOKIE_SECRET=threesecuresecret

# The following variables are populated from a Google Ouath project
# instructions to create a new project are available on the bit.ly
# Oauth proxy project page:
# https://github.com/bitly/google_auth_proxy#oauth-configuration

export GOOGLE_AUTH_PROXY_CLIENT_ID=
export GOOGLE_AUTH_PROXY_CLIENT_SECRET=
