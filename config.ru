require "bundler"
Bundler.require

require "logger"
require_relative "./app"

map '/assets' do
  sprockets = Sprockets::Environment.new.tap do |s|
    s.append_path File.join(File.dirname(__FILE__), 'assets', 'stylesheets')
    s.append_path File.join(File.dirname(__FILE__), 'assets', 'images')

    Sprockets::Helpers.configure do |config|
      config.environment = s
      config.prefix = '/assets'
      config.digest = true
    end
  end

  run sprockets
end

map '/' do
  run App
end
