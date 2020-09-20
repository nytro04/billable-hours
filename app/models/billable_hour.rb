# frozen_string_literal: true

class BillableHour < ApplicationRecord

belongs_to :user, class_name: 'User', foreign_key: 'employee_id', optional: true
  validates :employee_id, presence: true
  validates :company_id, presence: true
  validates :billable_rate, presence: true
  validates :start_time, presence: true
  validates :date, presence: true
  validates :end_time, presence: true

  def self.invoice(companies)
    new_hash = []
      companies.each do |company|
        bills = BillableHour.where("company_id = ?",company.id)
        if bills.present?

          bill_data = []
          total = []
          bills.each do |bill|
            _data_hash = {}
            hours = (Time.parse(bill.end_time.to_s) - Time.parse(bill.start_time.to_s)) / 3600
            unit_cost = bill.billable_rate
            cost = unit_cost * hours
            total << cost.to_f
              _data_hash['hours'] = hours
              _data_hash['unit_cost'] = unit_cost
              _data_hash['cost'] = cost
              _data_hash['employee_id'] = bill.employee_id
              bill_data << _data_hash
          end
          total = total.inject(:+)
          new_hash << {company: company.name,data: bill_data,total: total}
        end
      end
      new_hash
  end
end
