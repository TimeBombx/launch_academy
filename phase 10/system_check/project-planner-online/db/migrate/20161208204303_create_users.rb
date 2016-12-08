class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |table|
      table.string :first_name, nil: false
      table.string :last_name, nil: false
      table.string :email
    end
  end
end
