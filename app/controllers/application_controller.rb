class ApplicationController < ActionController::Base

  private

  def not_authenticated
    redirect_to login_path, alert: "ログインしてください"
  end

  def already_logged_in
    redirect_to diaries_path if current_user
  end
end
