module PluginKeyService

  PLUGIN_KEY = ('service-links-cloud' + (Rails.env.production? ? '' : '.' + Rails.env)).freeze

  PROJECT_PROPERTY_KEY = (PLUGIN_KEY + '.service_buttons').freeze

end