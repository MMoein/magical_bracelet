json.array!(@notifs) do |notif|
  json.extract! notif, :id, :date, :rule_id
  json.url notif_url(notif, format: :json)
end
