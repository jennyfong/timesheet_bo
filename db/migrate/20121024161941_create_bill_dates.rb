class CreateBillDates < ActiveRecord::Migration
  def self.up
    create_table :bill_dates do |t|
      t.column :user_id, :integer, :foreign_key => true
      t.column :date, :date
      t.column :is_paid, :boolean
      t.timestamps
    end
  end

  def self.down
    drop_table :bill_dates
  end
end
