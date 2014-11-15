json.array!(@interesteds) do |interested|
  json.extract! interested, :id, :title
  json.url interested_url(interested, format: :json)
end
