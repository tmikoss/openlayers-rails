module Openlayers
  module Rails
    class Engine < ::Rails::Engine
      initializer 'openlayers-rails' do |app|
        app.config.assets.precompile += [
          'openlayers/theme/default/google.css',
          'openlayers/theme/default/ie6-style.css',
          'openlayers/theme/default/style.css',
          'openlayers/theme/default/style.mobile.css'
        ]
      end
    end
  end
end

