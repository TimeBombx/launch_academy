const gameInfo = [
  {
    home_team: 'Patriots',
    away_team: 'Broncos',
    home_score: 7,
    away_score: 3
  },
  {
    home_team: 'Broncos',
    away_team: 'Colts',
    home_score: 3,
    away_score: 0
  },
  {
    home_team: 'Patriots',
    away_team: 'Colts',
    home_score: 11,
    away_score: 7
  },
  {
    home_team: 'Steelers',
    away_team: 'Patriots',
    home_score: 7,
    away_score: 21
  }
]

// YOUR CODE HERE
console.log('Teams\n-----');

team_names = []
for (var i = 0; i < gameInfo.length; i++) {
  if (!team_names.includes(gameInfo[i].home_team)) team_names.push(gameInfo[i].home_team);
  if (!team_names.includes(gameInfo[i].away_team)) team_names.push(gameInfo[i].away_team);
}

teams = []
for (var i = 0; i < team_names.length; i++) {
  teams.push(new Team(team_names[i]));
}

for (var i = 0; i < gameInfo.length; i++) {
  game = gameInfo[i];
  home_team = game.home_team;
  away_team = game.away_team;

  for (var j = 0; j < teams.length; j++) {
    if(teams[j].name == home_team)
      teams[j].wins += game.home_score;

    if(teams[j].name == away_team)
      teams[j].losses += game.away_score;
  }
}

sortedTeams = teams.sort(function(a, b){
  return (a.wins - b.wins) - (a.losses - b.losses);
}).reverse();

for (var i = 0; i < sortedTeams.length; i++) {
  sortedTeams[i].rank = i+1;
}

console.table(sortedTeams);