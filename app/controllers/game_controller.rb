# frozen_string_literal: true

class GameController < ApplicationController
  def index #creates first user
    @user = User.find_or_create_by(name: params['user_name'])
  end

  def show #rules
    # require "pry"; binding.pry
  end

  def about; end

  def create; end
end
