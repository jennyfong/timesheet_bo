class AddIsFavouriteToTimeLog < ActiveRecord::Migration

  def self.up
    add_column :time_logs, :is_favourite, :boolean

  end

  def self.down

    remove_column :time_logs, :is_favourite

  end

end