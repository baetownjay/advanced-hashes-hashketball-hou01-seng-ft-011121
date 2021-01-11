# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here
require 'pry'

def most_points_scored
  mvp_points = 0
  mvp_name = ''
  game_hash.each do |home_then_away, team_hash|
    team_hash.each do |team_color_players, players_array|
      if team_color_players == :players
        i = 0
        while i < players_array.length do
          if players_array[i][:points] > mvp_points
            mvp_points = players_array[i][:points]
            mvp_name = players_array[i][:player_name]
          end
        i += 1
        end
      end
    end
  end
  return "#{mvp_name} was the MVP with #{mvp_points} points"
end

def winning_team
  home_team_score = 0
  away_team_score = 0
  x = 0
  game_hash.each do |home_then_away, team_hash|
    sum = 0
    team_hash.each do |team_color_players, players_array|
      if team_color_players == :players
        i = 0
        while i < players_array.length do
          sum += players_array[i][:points]
          i += 1
        end    #CLOSING I ITERATION FOR PLAYERS
        if x == 0
          home_team_score = sum
        else
          away_team_score = sum
        end
      end     #CLOSING PLAYERS ARRAY loop
    end       #TEAM_COLOR_PLAYERS loop
    x += 1
  end         #CLOSING HOME_THEN_AWAY loop
  
  if home_team_score > away_team_score
    winning_team = game_hash[:home][:team_name]
    losing_team = game_hash[:away][:team_name]
    return "Tonight the #{winning_team} defeated the #{losing_team} with a final score of #{home_team_score} to #{away_team_score}."
  elsif home_team_score < away_team_score
    winning_team = game_hash[:away][:team_name]
    losing_team = game_hash[:home][:team_name]
    return "Tonight the #{winning_team} defeated the #{losing_team} with a final score of #{away_team_score} to #{home_team_score}."
  else 
    return "Tonights game was a draw between #{game_hash[:home][:team_name]} and the #{game_hash[:away][:team_name]} with a final score of #{home_team_score} to #{away_team_score}."
  end
end 

def player_with_longest_name
  longest_name = ''
  game_hash.each do |home_then_away, team_hash|
    team_hash.each do |team_color_players, players_array|
      if team_color_players == :players
        i = 0
        while i < players_array.length do
          if players_array[i][:player_name].length > longest_name.length
            longest_name = players_array[i][:player_name]
          end
          i += 1
        end
      end
    end
  end
  return longest_name
end

def long_name_steals_a_ton(player_with_long)
  most_steals = 0
  player_with_most_steals = ''
  game_hash.each do |home_then_away, team_hash|
    team_hash.each do |team_color_players, players_array|
      if team_color_players == :players
        i = 0
        while i < players_array.length do
          if players_array[i][:steals] > most_steals
            most_steals = players_array[i][:steals]
            player_with_most_steals = players_array[i][:player_name]
          end
          i += 1
        end
      end
    end
  end
  binding.pry
  if player_with_long == player_with_most_steals
    return true
  else
    return false
  end
end
  
puts winning_team