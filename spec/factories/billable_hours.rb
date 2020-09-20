# frozen_string_literal: true

FactoryBot.define do
  factory :billable_hour do
    user
    billable_rate { 89.8 }
    company
    date { '2020-09-17' }
    start_time { '2020-09-17 04:09:42' }
    end_time { '2020-09-17 04:09:42' }
  end
end
