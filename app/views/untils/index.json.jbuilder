json.array!(@untils) do |until|
  json.extract! until, :id, :rule_id
  json.url until_url(until, format: :json)
end
