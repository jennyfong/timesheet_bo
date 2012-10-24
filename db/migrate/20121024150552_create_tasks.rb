class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.column :user_id, :integer
      t.column :start_time, :datetime
      t.column :end_time, :datetime
      t.column :date, :date
      t.column :title, :string
      t.column :description, :string
      t.column :reference_id, :string
      t.column :duration, :integer
      t.column :order_no, :integer

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
