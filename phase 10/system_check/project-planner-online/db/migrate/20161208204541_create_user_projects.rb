class CreateUserProjects < ActiveRecord::Migration
  def change
    create_table :user_projects do |table|
      table.integer :user_id, null: false
      table.integer :project_id, null: false
    end
  end
end
