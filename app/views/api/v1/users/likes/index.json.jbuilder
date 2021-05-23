json.shops do
  json.array! @shops do |shop|
    json.extract! shop, :hotpepper_id
  end
end