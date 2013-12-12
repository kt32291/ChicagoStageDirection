json.array!(@auditions) do |audition|
  json.extract! audition, :id, :name, :post_date, :audition_date, :description, :company_id
  json.url audition_url(audition, format: :json)
end
