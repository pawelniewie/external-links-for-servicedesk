module PluginKeyService

	PLUGIN_KEY = 'service-links-cloud' + (Rails.env.production? ? '' :  '.' + Rails.env)

end