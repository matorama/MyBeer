json.array!(@posts) do |post|
  json.extract! post, :id, :name, :brewery, :description, :style, :abv, :label
  json.url post_url(post, format: :json)
end
