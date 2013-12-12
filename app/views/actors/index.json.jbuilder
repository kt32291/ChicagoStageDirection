json.array!(@actors) do |actor|
  json.extract! actor, :id, :first_name, :last_name, :equity, :height, :weight, :headshot, :resume, :email, :password_digest
  json.url actor_url(actor, format: :json)
end
