class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.column :email, :string, :unique => true
      t.column :first_name, :string
      t.column :last_name, :string
      t.column :identifier_url, :string, :unique => true

      t.timestamps
    end
    add_index :users, :identifier_url
  end

  def self.down
    drop_table :users
  end
end
