# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'BillableHours', type: :request do
  before(:each) do  
    user = create(:user)
    token = token_generator(user.id)
  end

  describe 'GET /billable_hours' do
    it 'retrieve all billable hours' do
      user = create(:user)
      token = token_generator(user.id)
      get billable_hours_path, headers: { 'Authorization': "#{token}" }
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /billable_hour' do
    it 'creates billable_hours' do
      user = create(:user)
      token = token_generator(user.id)
      post '/billable_hours', headers: { 'Authorization': "#{token}" }, params: { billable_hour: { employee_id: 1, billable_rate: 23, company_id: 1, date: '03/02/2020', start_time: '07:00', end_time: '21:00' } }
      expect(response).to have_http_status(201)
    end
  end

  describe 'GET /invoice' do
    it 'returns not invoice' do
      role = create(:role, name: 'Aban')
      user = create(:user, role_id: role.id)
      token = token_generator(user.id)
      get '/invoice', headers: { 'Authorization': "#{token}" }, params: {}
      expect(response).to have_http_status(401)
      expect(user.finance?).to be false
    end

    it 'returns invoice' do
      role = create(:role, name: 'Finance')
      user = create(:user, role_id: role.id)
      token = token_generator(user.id)
      get '/invoice', headers: { 'Authorization': "#{token}" }, params: {}
  
      expect(response).to have_http_status(200)
      expect(user.finance?).to be true
    end
  end
end
