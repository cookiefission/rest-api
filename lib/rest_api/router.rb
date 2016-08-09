module RestApi
  class Router

    RouteNotFound = Class.new(StandardError)
    MethodNotAllowed = Class.new(StandardError)

    def route(path, method)
      fail RouteNotFound
    end

    private

    def routes
      [

      ]
    end

  end
end
