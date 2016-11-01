require 'spec_helper'

RSpec.describe Leaderboard do
  describe ".new" do
    leader_board = Leaderboard.new

    it 'should create teams' do
      expect(leader_board.teams.nil?).to eq(false)
    end

    it 'should display the leader board' do
      expect(leader_board.display).to include("Rank")
      expect(leader_board.display).to include(leader_board.teams[0].wins.to_s)
    end
  end
end
