require 'rest_api/router'

module RestApi
  RSpec.describe Router do

    describe '#route' do

      subject(:route) { router.route(path, method) }

      let(:router) { Router.new }
      let(:path) { '/books' }
      let(:method) { 'GET' }

      context 'when the route does not exist' do
        let(:path) { '/ghosts' }

        it 'raise a routing error' do
          expect { route }.to raise_error(Router::RouteNotFound)
        end
      end

      context 'when the route exists' do
        context 'but the method is not allowed' do
          xit 'raise a routing error' do
            expect { route }.to raise_error(Router::MethodNotAllowed)
          end
        end
      end
    end

  end
end
