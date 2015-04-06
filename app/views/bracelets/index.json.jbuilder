json.array!(@bracelets) do |bracelet|
  json.extract! bracelet, :id, :color, :user_id, :is_shaking
  json.url bracelet_url(bracelet, format: :json)
end
