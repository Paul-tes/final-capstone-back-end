# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!
# Apache or NGINX already handles this.
config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present? || ENV['RENDER'].present?