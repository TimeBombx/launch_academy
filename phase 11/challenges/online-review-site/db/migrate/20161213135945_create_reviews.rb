class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :title, null: false, limit: 100
      t.integer :rating, null: false
      t.text :body, null: false
      t.timestamps null: false
    end
  end
end
