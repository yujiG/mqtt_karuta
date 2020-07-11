class GamesController < ApplicationController
  GAME_START_AFTER = 1.minute

  def create
    game = Game.create!(key: SecureRandom.hex(10), start_at: GAME_START_AFTER.since.beginning_of_minute)
    UpdateKarutaJob.set(wait: wait_count_of_game_start(game)).perform_later(game)
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

  private

  def wait_count_of_game_start(game)
    (game.start_at - Time.current).to_i
  end
end
