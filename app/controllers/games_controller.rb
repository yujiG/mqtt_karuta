class GamesController < ApplicationController
  def create
    game = Game.create!(key: SecureRandom.hex(10), start_at: Game::INTERVAL.since)
    UpdateKarutaJob.set(wait: Game::INTERVAL).perform_later(game)
    render :json => { key: game.key }, status: :created
  end

  def show
    @game = Game.find_by(key: params[:game_key])
    @user_key = params[:user_key]
    raise ActiveRecord::RecordNotFound if @game.blank? || !@game.users.exists?(key: @user_key)
    @karutas = Karuta.all
    @users = @game.users
    @points = @game.points.firstest
    render formats: :json
  end
end
