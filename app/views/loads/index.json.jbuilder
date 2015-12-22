json.array!(@loads) do |load|
  json.extract! load, :id, :name, :caliber, :primer, :bullet, :powder, :charge, :trim, :oal, :velocity, :notes, :load_date, :user_id
  json.url load_url(load, format: :json)
end
