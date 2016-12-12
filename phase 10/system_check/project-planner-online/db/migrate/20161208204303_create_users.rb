class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |table|
      table.string :first_name, null: false
      table.string :last_name, null: false
      table.string :email
    end
  end
end
