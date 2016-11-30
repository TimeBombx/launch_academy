// YOUR CODE HERE
describe('team', () => {
  var team;

  beforeEach(() => {
    team = new Team('Test');
  })

  it('has a name', () => {
    expect(team.name).toBe('Test');
  });

  it('has a rank', () => {
    expect(team.rank).toBe(0);
  });

  it('has a wins count', () => {
    expect(team.wins).toBe(0)
  });

  it('has a loss count', () => {
    expect(team.losses).toBe(0)
  });

});