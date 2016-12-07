class CreateCheckout < ActiveRecord::Migration
  def change
    create_table :checkouts do |table|
      table.integer :book_id
    end
  end
end
