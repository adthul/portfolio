Portfolio::Application.configure do

  config.cache_classes = true

  config.eager_load = true

  config.consider_all_requests_local       = false

  config.action_controller.perform_caching = true

  config.serve_static_assets = true

  config.assets.js_compressor = :uglifier

  config.assets.compile = true

  config.assets.digest = true

  config.assets.version = '1.0'

  config.log_level = :info

  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify

  config.log_formatter = ::Logger::Formatter.new

  config.action_mailer.default_url_options = { :host => 'www.andrewthul.com' }

  config.paperclip_defaults = {
  :storage => :s3,
  :url => ':s3_domain_url',
  :path => '/:class/:attachment/:id_partition/:style/:filename',
  :s3_credentials => {
    :bucket => ENV['AWS_BUCKET'],
    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }
  }
end
