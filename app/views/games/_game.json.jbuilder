json.extract! game, :id, :lives, :word, :current_try, :wrong_letters, :created_at, :updated_at
json.url game_url(game, format: :json)
