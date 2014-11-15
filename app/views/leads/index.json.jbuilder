json.array!(@leads) do |lead|
  json.extract! lead, :id, :first_name, :last_name, :email, :phone, :company, :interested, :status, :source, :comment, :address
  json.url lead_url(lead, format: :json)
end
