class App < Sinatra::Base
  # Middleware
  use Rack::CanonicalHost, ENV['CANONICAL_HOST']

  # Helpers
  helpers Sprockets::Helpers

  configure do
    set :haml, :format => :html5, :attr_wrapper => '"'
  end

  configure :development do
    set :haml, settings.haml.merge(:ugly => false)
  end

  configure :production do
    set :haml, settings.haml.merge(:ugly => true)
  end

  get "/" do
    haml :index
  end
end
