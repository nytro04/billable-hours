# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  # Authentication test suite
  describe 'POST /auth/login' do
    let(:valid_credentials) do
      {
        email: 'foo@bar.com',
        password: 'foofoo'
      }
    end
    let(:invalid_credentials) do
      {
        email: nil,
        password: nil
      }
    end
#    fresh_ticket = Ticket.create(:expiry => Date.tomorrow)
 #   expired_ticket = Ticket.create(:expiry => Date.yesterday)

    context 'When request is valid' do
      it 'returns an authentication token' do
        user = create(:user)
        post '/auth/login', params: { email: user.email, password: user.password }
        expect(response).to have_http_status(200)
      end


      it 'returns a invalid message' do
        post '/auth/login', params: valid_credentials
        expect(response).to have_http_status(401)
        # expect(json['message']).to match(/Invalid credentials/)
      end
    end

    # returns failure message when request is invalid
    context 'When request is invalid' do
      it 'returns a failure message' do
        post '/auth/login', params: invalid_credentials
        expect(response).to have_http_status(401)
        # expect(json['message']).to match(/Invalid credentials/)
      end
    end
  end
end
