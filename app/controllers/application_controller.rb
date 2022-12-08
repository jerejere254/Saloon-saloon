class ApplicationController < ActionController::API
    include ActionController::Cookies
    rescue_from ActiveRecord::RecordInvalid, with: :not_processable_entity
  before_action :authorized
  private
  def authorized
n    @current_user = User.find_by(id: session[:user_id])
    render json: {errors: ["Not Authorized"]}, status: :unauthorized unless @current_user
  end
  def not_processable_entity(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end

end
