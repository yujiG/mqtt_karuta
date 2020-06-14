json.game do
  json.id @game.id
end
json.my_user do
  json.id @user.id
end
json.users do
  json.array! @game.users do |user|
    json.id user.id
  end
end
