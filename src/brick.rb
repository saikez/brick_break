require 'gosu'
require_relative 'vector_2d'

class Brick
  def initialize
    @image = Gosu::Image.new('assets/images/paddle.png')
    @position = Vector2D[]
  end
end
