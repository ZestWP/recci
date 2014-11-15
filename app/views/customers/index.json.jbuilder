json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :email, :website, :contact, :website
  json.url customer_url(customer, format: :json)
end
