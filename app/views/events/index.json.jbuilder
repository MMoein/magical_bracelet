json.array!(@events) do |event|
  json.extract! event, :id, :until_id
  json.url event_url(event, format: :json)
end
