class AddMoreColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :day, :string
    add_column :users, :time, :string
    add_column :users, :voice, :string
  end
end
