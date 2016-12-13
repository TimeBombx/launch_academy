class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, null: false, default: ""
      t.string :password_hash
      t.string :role, null:false

      t.timestamps null: false
    end
  end
end
