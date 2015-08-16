json.array!(@gifs) do |gif|
  json.extract! gif, :id, :user_id, :description, :picture
  json.url gif_url(gif, format: :json)
end
