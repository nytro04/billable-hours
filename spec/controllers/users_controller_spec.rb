# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    let(:valid_attributes) do
        { email: 'foo@bar.com', password: 'foofoo', password_confirmation: 'foofoo', name: 'ghfghfghfg', role: 1 }
      end

    let(:invalid_attributes) do
         { email: Faker::Internet.email, password: 'foofoo', password_confirmation: 'foofoo' }
    end

    describe 'POST #create' do
        context 'with valid params' do
            it 'creates a new User' do
            expect do
                post :create, params: valid_attributes
            end.to change(User, :count).by(1)
            end
    
            it 'renders a JSON response with the new billable_hour' do
            post :create, params: valid_attributes
            expect(response).to have_http_status(201)
            expect(response.content_type).to eq('application/json; charset=utf-8')
            end
        end

        context 'with invalid params' do
            it 'render error for billable_hour' do
                post :create, params: invalid_attributes
                expect(response).to have_http_status(422)
                expect(response.content_type).to eq('application/json; charset=utf-8')
            end
        end
    end
end
