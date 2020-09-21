# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BillableHour, type: :model do
  #it { should belong_to(:user) }

  it { should validate_presence_of(:employee_id) }
  it { should validate_presence_of(:company_id) }
  it { should validate_presence_of(:billable_rate) }
  it { should validate_presence_of(:start_time) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:end_time) }

  describe '#invoice' do
    it 'should return company invoice' do 
      # data setup, method call, assertion
      company1 = create(:company,name: "Ecobank")
      company2 = create(:company,name: "SNNIT")
      company3 = create(:company,name: "GCB")

      role = create(:role, name: 'Lawyer')
      user = create(:user, role_id: role.id)


  
      bill = create(:billable_hour,user: user,company_id: company1.id,billable_rate: 43,date: '2020-09-17',
        start_time:'04:09:42', end_time: '04:09:42' )

      companies = Company.all

      result = BillableHour.invoice(companies)
      expect(result).not_to be_empty
      
    end

    it 'should return not company invoice' do 
      # data setup, method call, assertion
      company1 = create(:company,name: "Ecobank")
      company2 = create(:company,name: "SNNIT")
      company3 = create(:company,name: "GCB")

      role = create(:role, name: 'Lawyer')
      user = create(:user, role_id: role.id)

      companies = Company.all
      result = BillableHour.invoice(companies)
      expect(result).to be_empty
      
    end
  end
end
