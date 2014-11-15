json.array!(@levels) do |level|
  json.extract! level, :id, :title, :permission
  json.url level_url(level, format: :json)
end
