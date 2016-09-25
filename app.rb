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

  get '/.well-known/acme-challenge/RrwlnNejsKEMl4xx8Q6-sA4iHoj2X1UhTb9oHMs4K_I' do
    "RrwlnNejsKEMl4xx8Q6-sA4iHoj2X1UhTb9oHMs4K_I.fpnoueQ49h7Hmk0d8htnUcSxeCUKrDOCfLOVUoh0ZJ4"
  end

  get "/" do
    haml :index
  end
end
