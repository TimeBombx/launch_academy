class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |table|
      table.string :user_id, null: false
      table.string :meetup_id, null: false
      table.string :body, null: false

      table.timestamps null: false
    end
  end
end
