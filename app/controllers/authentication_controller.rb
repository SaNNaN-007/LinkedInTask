class AuthenticationController < ApplicationController
  
  def login
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      render json: { message: 'Logged in successfully' }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def logout
    session[:user_id] = nil
    render json: { message: 'Logged out successfully' }
  end
end
