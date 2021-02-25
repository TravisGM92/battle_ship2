# frozen_string_literal: true

class GameController < ApplicationController
  # creates first user
  def index
    @user = User.find_or_create_by(name: params['user_name'])
    require "pry"; binding.pry
  end

  # rules
  def show
    # require "pry"; binding.pry
  end

  def about; end

  def create; end
end
