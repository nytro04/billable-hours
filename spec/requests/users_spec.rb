# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let(:user) { build(:user) }
  let(:valid_attributes) do
    { email: 'foo@bar.com', password: 'foofoo', password_confirmation: 'foofoo', name: 'ghfghfghfg', role: 1 }
  end

  # User signup test suite
  describe 'POST /signup' do
    context 'when valid request' do
      it 'creates a new user' do
        post '/signup', params: valid_attributes
        expect(response).to have_http_status(201)
      end
    end
    
  end
end
