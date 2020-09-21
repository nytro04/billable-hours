# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Roles', type: :request do
  describe 'GET /roles' do
    it 'works! (now write some real specs)' do
      user = create(:user)
      token = token_generator(user.id)
      get '/roles', headers: { 'Authorization': "#{token}" }
      expect(response).to have_http_status(200)
    end
  end
end
