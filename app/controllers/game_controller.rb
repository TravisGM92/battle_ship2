# frozen_string_literal: true

class GameController < ApplicationController
  # creates first user
  def setup
    @user = User.find_or_create_by(name: params['user_name'])
  end

  # rules
  def show
    # require "pry"; binding.pry
  end
  # the below is a test html page to build a grid for
  # player boards
  def test
    require "pry"; binding.pry
  end

  def about; end

  def create; end
end
