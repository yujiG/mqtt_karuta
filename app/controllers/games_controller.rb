class GamesController < ApplicationController
  def create
    game = Game.create!(key: SecureRandom.hex(10))
    render :json => { key: game.key }, status: :created
  end

  def show
    @game = Game.find_by(key: params[:game_key])
    raise 'record_not_found' if @game.blank?
    @karuta = Karuta.all
    @users = @game.users.includes(:points)
    render formats: :json
  end
end
