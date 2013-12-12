json.array!(@associates) do |associate|
  json.extract! associate, :id, :name, :title, :company_id, :email, :password_digest
  json.url associate_url(associate, format: :json)
end
