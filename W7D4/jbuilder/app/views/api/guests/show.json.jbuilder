
  json.extract! @guest, :name, :age, :favorite_color

json.gifts do
  json.extract! @gifts, :title, :description
end
