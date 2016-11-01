require_relative 'team'

class Leaderboard
  attr_reader :teams

  GAME_INFO = [
    {
      home_team: "Patriots",
      away_team: "Broncos",
      home_score: 17,
      away_score: 13
    },
    {
      home_team: "Broncos",
      away_team: "Colts",
      home_score: 24,
      away_score: 7
    },
    {
      home_team: "Patriots",
      away_team: "Colts",
      home_score: 21,
      away_score: 17
    },
    {
      home_team: "Broncos",
      away_team: "Steelers",
      home_score: 11,
      away_score: 27
    },
    {
      home_team: "Steelers",
      away_team: "Patriots",
      home_score: 24,
      away_score: 31
    }
  ]

  def initialize()
    team_names = Array.new

    # filter through the teams make sure there is no dups
    GAME_INFO.each do |game|
      home_team = game[:home_team]
      away_team = game[:away_team]
      team_names << home_team unless team_names.include?(home_team)
      team_names << away_team unless team_names.include?(away_team)
    end

    # Create the teams
    @teams = Array.new
    team_names.each do |team|
      @teams << Team.new(team)
    end

    # Set the wins and loses for each team
    GAME_INFO.each do |game|
      home_team = game[:home_team]
      away_team = game[:away_team]

      @teams.each do |team|
        team.wins += game[:home_score] unless team.name == away_team
        team.losses += game[:away_score] unless team.name == home_team
      end
    end
  end

  def display
    table = ""
    table += "------------------------------------------------"
    table += "\n| %-10s%-8s%-14s%s |\n" % ["Name", "Rank", "Total Wins", "Total Losses"]

    # require "pry"
    # binding.pry

    sorted = @teams.sort_by! { |team| team.wins - team.losses }.reverse

    sorted.each_with_index do |team, index|
      table += "| %-10s%-8s%-14s%-12s |\n" % [team.name, index + 1, team.wins, team.losses]
    end
    table += "------------------------------------------------"
  end
end

leader_board = Leaderboard.new()
puts leader_board.display
