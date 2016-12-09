class AddTimestampsToTables < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :created_at, :datetime
    add_column :users, :updated_at, :datetime

    add_column :questions, :created_at, :datetime
    add_column :questions, :updated_at, :datetime

    add_column :answers, :created_at, :datetime
    add_column :answers, :updated_at, :datetime
  end
end
