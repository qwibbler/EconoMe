require 'rails_helper'

RSpec.describe EntityGroupsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/entity_groups').to route_to('entity_groups#index')
    end

    it 'routes to #new' do
      expect(get: '/entity_groups/new').to route_to('entity_groups#new')
    end

    it 'routes to #show' do
      expect(get: '/entity_groups/1').to route_to('entity_groups#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/entity_groups/1/edit').to route_to('entity_groups#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/entity_groups').to route_to('entity_groups#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/entity_groups/1').to route_to('entity_groups#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/entity_groups/1').to route_to('entity_groups#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/entity_groups/1').to route_to('entity_groups#destroy', id: '1')
    end
  end
end
