class CreateUserProjects < ActiveRecord::Migration
  def change
    create_table :user_projects do |table|
      table.integer :user_id, nil: false
      table.integer :project_id, nil: false
    end
  end
end
