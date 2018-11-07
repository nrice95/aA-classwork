json.array! @guests do |guest|
  json.name guest.name
  json.age
  json.id guest.id
end
