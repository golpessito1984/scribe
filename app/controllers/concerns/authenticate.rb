module Authenticate
  def authenticate
    unless sign_in?
      redirect_to new_session_path
    end
  end

  def sign_in?
    current_user.present?
  end

  def current_user
    session[:user_id]
  end

  def login_as(user)
    session[:user_id] = user.id
  end

  def sign_in_as(session_params)
    user = User.find_by_email(session_params[:email])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(session_params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to root_path
    else
      # If user's login doesn't work, send them back to the login form.
      redirect_to new_session_path
    end
  end
end