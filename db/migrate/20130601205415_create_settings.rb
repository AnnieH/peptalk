class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :phone_number

      t.timestamps
    end
  end
end
