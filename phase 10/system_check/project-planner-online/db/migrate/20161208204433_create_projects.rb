class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |table|
      table.string :name, nil: false
      table.string :description
    end
  end
end
