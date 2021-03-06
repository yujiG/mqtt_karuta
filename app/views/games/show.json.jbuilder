json.game do
  json.id @game.id
  json.start_at @game.start_at
  json.karuta_id @game.karuta&.id
  json.is_last @game.last_karuta?
  json.finished @game.finished?
end
json.points do
  json.array! @points do |point|
    json.user_id point.user_id
    json.karuta_id point.karuta_id
  end
end
json.karutas do
  json.array! @karutas do |karuta|
    json.id karuta.id
    json.name karuta.name
  end
end
json.users do
  json.array! @users do |user|
    json.id user.id
    json.is_me user.key == @user_key
  end
end
