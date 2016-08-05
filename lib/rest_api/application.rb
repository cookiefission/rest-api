module RestApi
  class Application

    def self.call(env)
      [status(env), {}, ['Hello World']]
    end

    def self.status(env)
      case env['REQUEST_METHOD']
      when 'GET'
        200
      when 'POST'
        201
      when 'DELETE'
        204
      else
        405
      end
    end

  end
end
