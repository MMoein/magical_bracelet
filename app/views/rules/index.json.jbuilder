json.array!(@rules) do |rule|
  json.extract! rule, :id, :bracelet_id, :action_id, :event_id, :until_id
  json.url rule_url(rule, format: :json)
end
