require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Code is not reloaded between requests.
  config.enable_reloading = false

  # Eager load code on boot.
  config.eager_load = true
  
  # SMTP settings for Action Mailer.
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: ENV.fetch('SMTP_ADDRESS', 'mail.womall.africa'),
    port: ENV.fetch('SMTP_PORT', 587).to_i,
    domain: ENV.fetch('SMTP_DOMAIN', 'womall.africa'),
    user_name: ENV.fetch('SMTP_USERNAME', 'admin@womall.africa'),
    password: ENV.fetch('SMTP_PASSWORD'),
    authentication: :login,
    enable_starttls_auto: true,
    openssl_verify_mode: OpenSSL::SSL::VERIFY_PEER
  }
  
  config.action_mailer.default_options = { from: ENV.fetch('SMTP_DEFAULT_FROM', 'admin@womall.africa') }
  
  
  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

  # Ensure master key is available for credentials decryption.
  config.require_master_key = true

  # Disable serving static files from `public/`, relying on NGINX/Apache instead.
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Compress assets and don't fallback to the asset pipeline if precompiled asset is missed.
  config.assets.compile = false

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Force all access to the app over SSL.
  config.force_ssl = true

  # Log to STDOUT in production.
  config.logger = ActiveSupport::Logger.new(STDOUT)
    .tap  { |logger| logger.formatter = ::Logger::Formatter.new }
    .then { |logger| ActiveSupport::TaggedLogging.new(logger) }

  # Prepend all log lines with the following tags.
  config.log_tags = [ :request_id ]

  # Set log level to info or as per environment setting.
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info").to_sym

  # Disable caching for Action Mailer templates even if Action Controller caching is enabled.
  config.action_mailer.perform_caching = false

  # Enable locale fallbacks for I18n.
  config.i18n.fallbacks = true

  # Disable schema dumps after migrations.
  config.active_record.dump_schema_after_migration = false

  # Disable deprecation reporting in production.
  config.active_support.report_deprecations = false

  # ActionMailer URL Options
  config.action_mailer.default_url_options = { host: 'womall.africa', protocol: 'https' }

  # Uncomment to protect against DNS rebinding attacks.
  # config.hosts = ["womall.africa", /.*\.womall\.africa/]
end
