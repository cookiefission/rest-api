module RestApi
  class Application

    def self.call(env)
      [200, {}, ['Hello World']]
    end

  end
end
