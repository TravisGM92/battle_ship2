# frozen_string_literal: true

class Board < ApplicationRecord
  has_many :cells
  has_many :ships
  belongs_to :user
end
