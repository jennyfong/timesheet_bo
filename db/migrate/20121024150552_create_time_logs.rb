class CreateTimeLogs < ActiveRecord::Migration
  def self.up
    create_table :time_logs do |t|
      t.column :start_time, :datetime
      t.column :end_time, :datetime
      t.column :bill_date_id, :integer
      t.column :title, :string
      t.column :description, :string
      t.column :reference_id, :string
      t.column :duration, :integer
      t.column :position, :integer
      t.column :is_break, :boolean, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :time_logs
  end
end
