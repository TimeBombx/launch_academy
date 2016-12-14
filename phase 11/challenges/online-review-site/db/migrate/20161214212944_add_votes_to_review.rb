class AddVotesToReview < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :upvotes, :integer, default: 0
    add_column :reviews, :downvotes, :integer, default: 0
  end
end
