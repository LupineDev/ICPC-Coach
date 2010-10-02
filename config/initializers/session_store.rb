# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ICPC-Coach_session',
  :secret      => '2187987ffb039c1bcbebe29187dffb145d1a392edaa4f22738aa120ecfc5216201eaddd1878e906c38bc94585c6d04615596fc220044b1ff0c46d1820f244e41'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
