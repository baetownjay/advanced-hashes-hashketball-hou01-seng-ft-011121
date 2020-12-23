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
def num_points_scored(player_name)
  
  game_hash.each do |home_then_away, hash|
    hash.each do |titles, info|
      if titles == :players
        all_hashes = info
        all_hashes.each do |each_player_hash|
          if each_player_hash[:player_name] == player_name
            return each_player_hash[:points]
          end
        end
      end
    end
  end
end

def shoe_size(player_name)
  
  game_hash.each do |home_then_away, hash|
    hash.each do |titles, info|
      if titles == :players
        all_hashes = info
        all_hashes.each do |each_player_hash|
          if each_player_hash[:player_name] == player_name
            return each_player_hash[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |home_then_away, hash|
    hash.each do |titles, info|
      if titles == :team_name
        if team_name == info
          return hash[:colors]
        end
      end
    end
  end
end
  
def team_names
  inner_team_names = []
  game_hash.each do |home_then_away, hash|
    hash.each do |titles, info|
      if titles == :team_name
        inner_team_names << hash[:team_name]
      end
    end
  end
  return inner_team_names
end

def player_numbers(team_name)
  jersey_numbers = []
  game_hash.each do |home_then_away, hash|
    hash.each do |titles, info|
      if titles == :team_name
        if info == team_name
          while jersey_numbers.length < 5 do
            jersey_numbers << hash[:players][jersey_numbers.length][:number]
          end
        end
      end
    end
  end
  jersey_numbers
end
        
def player_stats(player_name)
  game_hash.each do |home_then_away, hash|
    hash.each do |titles, info|
      if titles == :players
        i = 0
        while i < info.length do
          if hash[:players][i][:player_name] == player_name
            return hash[:players][i]
          end
          i += 1
        end
      end
    end
  end
end

def big_shoe_rebounds
  biggest_shoe = 0
  number_of_rebounds = ''
  game_hash.each do |home_then_away, hash|
    hash.each do |team_colors_players, players_hash|
      if team_colors_players == :players
        i = 0
        while i < players_hash.length do
          if players_hash[i][:shoe] > biggest_shoe
            biggest_shoe = players_hash[i][:shoe]
            number_of_rebounds = players_hash[i][:rebounds]
          end
          i += 1
        end
      end
    end
  end
  return number_of_rebounds
end