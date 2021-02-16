# frozen_string_literal: true

class Cell < ApplicationRecord
  validates_presence_of :coordinate
  belongs_to :board

  def self.create_cells(size, _human_name)
    letters = ('a'..'z').to_a
    x_axis = letters[0..(size.split('X')[0].to_i - 1)]
    y_axis = (1..(size.split('X')[1].to_i)).to_a
    x_axis.each do |x|
      y_axis.each do |y|
        User.all.each do |user|
          user.board.cells.create!(coordinate: x + y.to_s)
        end
      end
    end
  end
end
