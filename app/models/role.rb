# frozen_string_literal: true

class Role < ApplicationRecord
  LAWYER = 'Lawyer'
  FINANCE = 'Finance'
  SYSADMIN = 'Sysadmin'

  has_many :users

  validates :name, presence: true

  def lawyer?
    name  == LAWYER
  end

  def finance?
    name  == FINANCE
  end

  def sysadmin?
    name  == SYSADMIN
  end
end
