class DiariesController < ApplicationController
  def index
    @diaries = current_user.diaries
  end

  def show

  end
end
