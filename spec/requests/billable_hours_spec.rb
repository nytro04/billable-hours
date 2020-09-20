# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'BillableHours', type: :request do
  describe 'GET /billable_hours' do
    it 'works! (now write some real specs)' do
      get billable_hours_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /billable_hour' do
    it 'creates billable_hours' do
      post '/billable_hours', params: { billable_hour: { employee_id: 1, billable_rate: 23, company_id: 1, date: '03/02/2020', start_time: '07:00', end_time: '21:00' } }
      expect(response).to have_http_status(201)
    end
  end

  describe 'GET /invoice' do
    it 'returns invoice' do
      get '/invoice', params: {}
      expect(response).to have_http_status(200)
    end
  end
end
