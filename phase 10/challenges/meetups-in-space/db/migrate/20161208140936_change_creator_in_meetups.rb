class ChangeCreatorInMeetups < ActiveRecord::Migration
  def change
    remove_column :meetups, :creator, :string
    add_column :meetups, :user_id, :integer, after: :title
  end
end