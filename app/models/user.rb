# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  belongs_to :role, class_name: 'Role', foreign_key: 'role_id', optional: true
  
  has_many :billable_hours, foreign_key: 'employee_id'

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: {minimum: 6}

  default_scope { includes(:role) }

  def lawyer?
    role.lawyer?
  end

  def finance?
    role.finance?
  end

  def sysadmin?
    role.sysadmin?
  end
end
