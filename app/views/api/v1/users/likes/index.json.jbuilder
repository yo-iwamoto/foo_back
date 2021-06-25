json.available_count @result[:results_available]
json.shops do
  json.array! @result[:shop] do |shop|
    json.id shop[:id]
    json.address shop[:address]
    json.barrier_free shop[:barrier_free]
    json.budget do
      json.average shop[:budget][:average]
      json.name shop[:budget][:name]
    end
    json.capacity shop[:capacity]
    json.card shop[:card]
    json.catch_copy shop[:catch]
    json.english shop[:english]
    json.genre shop[:genre][:name]
    json.lat shop[:lat]
    json.lng shop[:lng]
    json.photo shop[:photo][:pc][:l]
    json.lunch shop[:lunch]
    json.name shop[:name]
    json.name_kana shop[:name_kana]
    json.parking shop[:parking]
    json.non_smoking shop[:non_smoking]
    json.open shop[:open]
    json.station_name shop[:station_name]
    json.url shop[:urls][:pc]
    json.wifi shop[:wifi]
    json.foo shop[:foo] || false
    json.liked shop[:liked] || false
    json.foo_count shop[:foo_count] || 0
    json.likes_count shop[:likes_count] || 0
  end
end