class ApplicationController < ActionController::Base

  private

  def already_logged_in
    redirect_to diaries_path if current_user
  end
end
