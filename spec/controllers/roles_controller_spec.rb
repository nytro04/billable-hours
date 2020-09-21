# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe RolesController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Role. As you add validations to Role, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      name: Faker::Name.name
    }
  end

  let(:invalid_attributes) do
    {
      name: nil
    }
  end

  let(:valid_session) { {} }

  before(:each) do  
    user = create(:user)
    token = token_generator(user.id)
    request.headers.merge!('Authorization': "Bearer #{token}")
  end

  describe 'GET #index' do
    it 'returns a success response' do
      role = Role.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      role = Role.create! valid_attributes
      get :show, params: { id: role.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Role' do
        expect do
          post :create, params: { role: valid_attributes }, session: valid_session
        end.to change(Role, :count).by(1)
      end

      it 'renders a JSON response with the new role' do
        post :create, params: { role: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response.location).to eq(role_url(Role.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new role' do
        post :create, params: { role: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        {
          name: Faker::Name.name
        }
      end

      it 'updates the requested role' do
        role = Role.create! valid_attributes
        put :update, params: { id: role.to_param, role: new_attributes }, session: valid_session
        role.reload
      end

      it 'renders a JSON response with the role' do
        role = Role.create! valid_attributes

        put :update, params: { id: role.to_param, role: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the role' do
        role = Role.create! valid_attributes

        put :update, params: { id: role.to_param, role: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested role' do
      role = Role.create! valid_attributes
      expect do
        delete :destroy, params: { id: role.to_param }, session: valid_session
      end.to change(Role, :count).by(-1)
    end
  end
end
