class PointsController < ApplicationController
  def create
    user = User.find_by(key: params[:key])
    raise 'record_not_found' if user.blank?
    user.points.create!(create_params)
    render :json => { message: 'created!' }, status: :created
  end

  private

  def create_params
    params.permit(:karuta_id)
  end
end
