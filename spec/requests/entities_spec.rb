# require 'rails_helper'

# # This spec was generated by rspec-rails when you ran the scaffold generator.
# # It demonstrates how one might use RSpec to test the controller code that
# # was generated by Rails when you ran the scaffold generator.
# #
# # It assumes that the implementation code is generated by the rails scaffold
# # generator. If you are using any extension libraries to generate different
# # controller code, this generated spec may or may not pass.
# #
# # It only uses APIs available in rails and/or rspec-rails. There are a number
# # of tools you can use to make these specs even more expressive, but we're
# # sticking to rails and rspec-rails APIs to keep things simple and stable.

# RSpec.describe '/entities', type: :request do
#   # This should return the minimal set of attributes required to create a valid
#   # Entity. As you add validations to Entity, be sure to
#   # adjust the attributes here as well.
#   let(:valid_attributes) do
#     skip('Add a hash of attributes valid for your model')
#   end

#   let(:invalid_attributes) do
#     skip('Add a hash of attributes invalid for your model')
#   end

#   describe 'GET /index' do
#     it 'renders a successful response' do
#       Entity.create! valid_attributes
#       get entities_url
#       expect(response).to be_successful
#     end
#   end

#   describe 'GET /show' do
#     it 'renders a successful response' do
#       entity = Entity.create! valid_attributes
#       get entity_url(entity)
#       expect(response).to be_successful
#     end
#   end

#   describe 'GET /new' do
#     it 'renders a successful response' do
#       get new_entity_url
#       expect(response).to be_successful
#     end
#   end

#   describe 'GET /edit' do
#     it 'renders a successful response' do
#       entity = Entity.create! valid_attributes
#       get edit_entity_url(entity)
#       expect(response).to be_successful
#     end
#   end

#   describe 'POST /create' do
#     context 'with valid parameters' do
#       it 'creates a new Entity' do
#         expect do
#           post entities_url, params: { entity: valid_attributes }
#         end.to change(Entity, :count).by(1)
#       end

#       it 'redirects to the created entity' do
#         post entities_url, params: { entity: valid_attributes }
#         expect(response).to redirect_to(entity_url(Entity.last))
#       end
#     end

#     context 'with invalid parameters' do
#       it 'does not create a new Entity' do
#         expect do
#           post entities_url, params: { entity: invalid_attributes }
#         end.to change(Entity, :count).by(0)
#       end

#       it "renders a response with 422 status (i.e. to display the 'new' template)" do
#         post entities_url, params: { entity: invalid_attributes }
#         expect(response).to have_http_status(:unprocessable_entity)
#       end
#     end
#   end

#   describe 'PATCH /update' do
#     context 'with valid parameters' do
#       let(:new_attributes) do
#         skip('Add a hash of attributes valid for your model')
#       end

#       it 'updates the requested entity' do
#         entity = Entity.create! valid_attributes
#         patch entity_url(entity), params: { entity: new_attributes }
#         entity.reload
#         skip('Add assertions for updated state')
#       end

#       it 'redirects to the entity' do
#         entity = Entity.create! valid_attributes
#         patch entity_url(entity), params: { entity: new_attributes }
#         entity.reload
#         expect(response).to redirect_to(entity_url(entity))
#       end
#     end

#     context 'with invalid parameters' do
#       it "renders a response with 422 status (i.e. to display the 'edit' template)" do
#         entity = Entity.create! valid_attributes
#         patch entity_url(entity), params: { entity: invalid_attributes }
#         expect(response).to have_http_status(:unprocessable_entity)
#       end
#     end
#   end

#   describe 'DELETE /destroy' do
#     it 'destroys the requested entity' do
#       entity = Entity.create! valid_attributes
#       expect do
#         delete entity_url(entity)
#       end.to change(Entity, :count).by(-1)
#     end

#     it 'redirects to the entities list' do
#       entity = Entity.create! valid_attributes
#       delete entity_url(entity)
#       expect(response).to redirect_to(entities_url)
#     end
#   end
# end
