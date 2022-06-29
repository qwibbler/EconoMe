require 'rails_helper'

RSpec.describe SplashController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/').to route_to('splash#home')
    end
  end
end
