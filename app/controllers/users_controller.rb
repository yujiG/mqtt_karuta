class UsersController < ApplicationController
  def create
    game = Game.find_by(key: params[:key])
    raise 'record_not_found' if game.blank?
    user = game.users.create!(key: SecureRandom.hex(10))
    render :json => { key: user.key }, status: :created
  end
end
