require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'csv'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rims
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # Don't generate system test files.
    # config.generators.system_tests = nil
    # Filter sensitive parameters out of logs
    config.filter_parameters << :password
    config.filter_parameters << :password_confirmation

    config.exceptions_app = self.routes
    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: true,
        request_specs: true
      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end

    config.action_controller.action_on_unpermitted_parameters = :raise
    config.i18n.enforce_available_locales = false

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Enable escaping HTML in JSON.
    config.active_support.escape_html_entities_in_json = true
    # Don't encode ampersands into \u0026 when creating JSON

    # config.active_support.escape_html_entities_in_json = false
    config.i18n.enforce_available_locales = true
    config.active_record.default_timezone = :utc

    # Use SQL instead of Active Record's schema dumper when creating the database.
    # This is necessary if your schema can't be completely dumped by the schema dumper,
    # like if you have constraints or database-specific column types
    # config.active_record.schema_format = :sql

    # Enable the asset pipeline
    config.assets.enabled = true

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.autoload_paths << Rails.root.join('lib')

    # Needs to be false on Heroku
    config.public_file_server.enabled = false
    config.public_file_server.headers = { 'Cache-Control' => 'public, max-age=31536000' }

    # Add the fonts path
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts', 'vendor')

    # Precompile additional assets
    config.assets.precompile += %w( *.svg *.eot *.woff *.ttf *.png *.jpg *.jpeg *.gif)

  end
end
