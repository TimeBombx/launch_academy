class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, null: false, limit: 18
      t.string :first_name, limit: 30
      t.string :last_name, limit: 30
      t.string :email, null: false, limit: 100
      t.string :password, null: false
    end
  end
end
