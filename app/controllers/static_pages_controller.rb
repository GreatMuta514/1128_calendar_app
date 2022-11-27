# frozen_string_literal: true

class StaticPagesController < ApplicationController
  before_action :already_logged_in

  def top; end
end
