# frozen_string_literal: true

class Company < ApplicationRecord
  # belongs_to
  validates :name, presence: true
end
