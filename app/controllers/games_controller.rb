class GamesController < ApplicationController
  def create
    game = Game.create!(key: SecureRandom.hex(10))
    render :json => { key: game.key }, status: :created
  end

end
