json.array!(@bracelet_actions) do |bracelet_action|
  json.extract! bracelet_action, :id, :color, :shake
  json.url bracelet_action_url(bracelet_action, format: :json)
end
