# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_moretolife_session',
  :secret      => '168f392f871fd8e860d2c9e5b736e25d1d88235d1b6e39f077fce1d9dc5b9e9b4aff02df771f9dd62221f800e1c9bb76d81ef7c858959aad9fa211b0257b77c7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
