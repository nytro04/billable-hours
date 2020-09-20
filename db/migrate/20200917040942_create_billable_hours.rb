# frozen_string_literal: true

class CreateBillableHours < ActiveRecord::Migration[6.0]
  def change
    create_table :billable_hours do |t|
      t.integer :employee_id
      t.numeric :billable_rate
      t.integer :company_id
      t.date :date
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
