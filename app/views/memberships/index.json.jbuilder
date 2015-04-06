json.array!(@memberships) do |membership|
  json.extract! membership, :id, :bracelet_id, :group_id
  json.url membership_url(membership, format: :json)
end
