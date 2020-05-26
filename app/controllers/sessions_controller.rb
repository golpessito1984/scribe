class SessionsController < ApplicationController
  def new
  end

  def create
    sign_in_as(session_params)
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

end