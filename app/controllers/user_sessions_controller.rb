# frozen_string_literal: true

class UserSessionsController < ApplicationController
  before_action :already_logged_in, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to(diaries_path, notice: 'ログインに成功しました')
    else
      flash.now[:alert] = 'ログインに失敗しました'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: 'ログアウトしました')
  end

  def guest_login
    @guest_user = User.create(
    nickname: 'ゲスト',
    email: SecureRandom.alphanumeric(10) + "@guest.com",
    password: 'password',
    password_confirmation: 'password'
    )
    auto_login(@guest_user)
    redirect_to diaries_path, success: 'ゲストとしてログインしました'
  end
end
