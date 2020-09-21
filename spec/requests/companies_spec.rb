# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Companies', type: :request do
  describe 'GET /companies' do
    it 'retrieves all companies' do
      user = create(:user)
      token = token_generator(user.id)
      get companies_path, headers: { 'Authorization': "#{token}" }
      
      expect(response).to have_http_status(200)
    end
  end
end
