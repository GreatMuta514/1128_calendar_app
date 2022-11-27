# frozen_string_literal: true

class DiariesController < ApplicationController
  before_action :require_login

  def index
    @diaries = current_user.diaries
  end

  def show; end
end
