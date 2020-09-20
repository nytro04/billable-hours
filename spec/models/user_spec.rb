# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do

   it { should have_many(:billable_hours) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:password) }
 


  describe '#lawyer?' do
    it 'should calculate and return age of person' do
      # data setup, method call, assertion
      role = create(:role, name: 'Lawyer')
      user = create(:user, role_id: role.id)
     # user.update(role: “lawyer”)
      expect(user.lawyer?).to be true
      
    end

    it 'should calculate and return age of person' do
      # data setup, method call, assertion
      role = create(:role, name: 'Aban')
      user = create(:user, role_id: role.id)
      expect(user.lawyer?).to be false
      
    end
  end

  describe '#finance?' do
    it 'should calculate and return age of person' do
      # data setup, method call, assertion
      role = create(:role, name: 'Finance')
      user = create(:user, role_id: role.id)
      expect(user.finance?).to be true
      
    end

    it 'should calculate and return age of person' do
      # data setup, method call, assertion
      role = create(:role, name: 'Aban')
      user = create(:user, role_id: role.id)
      expect(user.finance?).to be false
      
    end
  end
  describe '#sysadmin?' do
    it 'should calculate and return age of person' do
      # data setup, method call, assertion
      role = create(:role, name: 'Sysadmin')
      user = create(:user, role_id: role.id)
     # user.update(role: “lawyer”)
      expect(user.sysadmin?).to be true
      
    end

    it 'should calculate and return age of person' do
      # data setup, method call, assertion
      role = create(:role, name: 'Aban')
      user = create(:user, role_id: role.id)
      expect(user.sysadmin?).to be false
      
    end
  end
end