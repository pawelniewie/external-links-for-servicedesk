class DescriptorController < ApplicationController

  def show
    render :show, locals: {
      base_url: 'https://' + Rails.application.secrets.http_host,
      plugin_key: PluginKeyService::PLUGIN_KEY,
      project_property_key: PluginKeyService::PROJECT_PROPERTY_KEY,
      client_id: Rails.application.secrets.client_id,
      plugin_name: Rails.application.secrets.plugin_name + (Rails.env.production? ? '' : ' [Development]')
    }
  end

end
