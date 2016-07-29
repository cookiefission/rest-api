require 'rest_api/application'

module Features
  module App
    def app
      RestApi::Application
    end
  end
end

World(Features::App)
