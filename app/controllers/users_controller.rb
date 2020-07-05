class UsersController < ApplicationController
  MAX_GAME_USER = 3

  def create
    game = Game.find_by(key: params[:key])
    raise ActiveRecord::RecordNotFound if game.blank?
    raise ApiError, '人数が満員でした' if game.users.size == MAX_GAME_USER
    user = game.users.create!(key: SecureRandom.hex(10))
    render :json => { key: user.key }, status: :created
  end
end
