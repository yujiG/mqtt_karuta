module ErrorRescues
  extend ActiveSupport::Concern

  included do
    # StandardError must be above of other
    rescue_from StandardError, with: :rescue_standard_error
    rescue_from ActiveRecord::RecordNotFound, with: :rescue_record_not_found
    rescue_from ApiError, with: :rescue_api_error
  end

  def rescue_standard_error(error)
    render :json => { message: error.message}, status: :internal_server_error
  end

  def rescue_record_not_found(error)
    render :json => { message: error.message}, status: :not_found
  end

  def rescue_api_error(error)
    render :json => { message: error.message}, status: :unprocessable_entity
  end
end
