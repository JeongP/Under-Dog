json.extract! player, :id, :name, :height, :weight, :team, :image1, :image2, :image3, :image4, :video, :created_at, :updated_at
json.url player_url(player, format: :json)
