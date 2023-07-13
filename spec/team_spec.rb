require './lib/player'
require './lib/team'

RSpec.describe Team do
  it 'exists' do
    team = Team.new("Dodgers", "Los Angeles")
    
    expect(team).to be_a(Team)
  end

  it 'has readable attributes' do
    team = Team.new("Dodgers", "Los Angeles")

    expect(team.roster).to eq([])
    expect(team.player_count).to eq(0)
  end

  it '.add_player' do
    team = Team.new("Dodgers", "Los Angeles")
    player_1 = Player.new("Michael Palledorous" , 1000000, 36)
    player_2 = Player.new("Kenny DeNunez", 500000, 24)
    team.add_player(player_1)
    team.add_player(player_2)

    expect(team.roster).to eq([player_1, player_2])
    expect(team.player_count).to eq(2)
  end

  it 'measures term, cost, details' do
    team = Team.new("Dodgers", "Los Angeles")
    player_1 = Player.new("Michael Palledorous" , 1000000, 36)
    player_2 = Player.new("Kenny DeNunez", 500000, 24)
    player_3 = Player.new("Alan McClennan", 750000, 48)
    player_4 = Player.new("Hamilton Porter", 100000, 12)
    team.add_player(player_1)
    team.add_player(player_2)
    team.add_player(player_3)
    team.add_player(player_4)

    expect(team.long_term_players).to eq([player_1, player_3])
    expect(team.short_term_players).to eq([player_2, player_4])

    details_result = {"total_value" => 85200000, "player_count" => 4}
    expect(team.details).to eq(details_result)
  end


end
