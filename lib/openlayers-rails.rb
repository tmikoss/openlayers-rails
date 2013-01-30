require "openlayers-rails/version"

module Openlayers
  module Rails
    class Engine < ::Rails::Engine
      initializer 'openlayers-rails' do |app|
        app.config.assets.precompile += %w( openlayers/theme/default/style.css )
      end
    end
  end
end
