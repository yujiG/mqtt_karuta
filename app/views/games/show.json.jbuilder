json.game do
  json.id @game.id
  json.start_at @game.start_at
  json.karuta_id @game.karuta_id
end
json.karuras do
  json.array! @karutas do |karuta|
    json.id karuta.id
    json.name karuta.name
  end
end
json.users do
  json.array! @users do |user|
    json.id user.id
    json.is_me user.key == params[:user_key]
    json.points do
      json.array! user.points do |point|
        json.karuta_id point.karuta_id
      end
    end
  end
end
