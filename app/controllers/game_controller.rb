# frozen_string_literal: true

class GameController < ApplicationController
  def index
    @user = params['user_name']
  end

  def show; end

  def about; end

  def create; end
end
