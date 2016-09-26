json.array!(@slides) do |slide|
  json.extract! slide, :id, :title, :photo
  json.url slide_url(slide, format: :json)
end
