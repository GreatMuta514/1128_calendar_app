# frozen_string_literal: true

class DiariesController < ApplicationController
  before_action :require_login
  before_action :duplication_check, only: :create

  def index
    @diaries = current_user.diaries
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      redirect_to completion_diaries_path
    else
      flash.now[:danger] = '日記の作成に失敗しました'
      render 'form'
    end
  end

  def show
    @diary = Diary.find_by(user: current_user, start_time: params[:id].to_time)
  end

  def completion; end

  private

  def diary_params
    params.require(:diary).permit(:good_or_bad, :review_the_day, :for_me_tommorrow,
                                  :user_id).merge(user_id: current_user.id, start_time: Time.current.beginning_of_day)
  end

  def duplication_check
    redirect_to diaries_path, notice: '今日の日記はすでに登録済みです' if Diary.find_by(user: current_user,
                                                                         start_time: Time.current.beginning_of_day)
  end
end
