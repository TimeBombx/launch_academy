class CreateCommentTable < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :recipe_id
    end
  end
end
