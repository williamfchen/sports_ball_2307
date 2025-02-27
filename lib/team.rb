class Team
  attr_reader :team_name, :city, :roster

  def initialize(team_name, city)
    @team_name = team_name
    @city = city
    @roster = []
  end

  def player_count
    @roster.count
  end

  def add_player(player)
    @roster << player
  end

  def long_term_players
    long_list = []
    roster.each do |player|
      if player.contract_length > 24
        long_list << player
      end
    end
    long_list
  end

  def short_term_players
    short_list = []
    roster.each do |player|
      if player.contract_length <= 24
        short_list << player
      end
    end
    short_list
  end

  def details
    total_value = 0
    roster.each do |player|
      total_value += player.total_cost
    end
    {"total_value" => total_value, "player_count" => player_count}
  end

  def average_cost_of_player
    total_value = 0
    roster.each do |player|
      total_value += player.total_cost
    end
    avg_cost = total_value/player_count.to_f
    # I'm having trouble formatting the avg_cost. numerically it's correct
  end

  def players_by_last_name
    sorted_players = roster.sort_by do |player|
      player.last_name
    end
    last_names = sorted_players.map do |player|
      player.last_name
    end
    last_names.join(", ")
  end


end