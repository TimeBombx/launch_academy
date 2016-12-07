class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |table|
      table.integer :book_id
      table.integer :category_id
    end
  end
end
