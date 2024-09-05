require 'gosu'
require_relative 'vector_2d'
require_relative 'mixins/drawable'

# Boing
#
class Ball
  include Drawable
  attr_accessor :velocity

  def initialize(position: Vector2D[])
    @image = Gosu::Image.new('assets/images/ball.png')
    @position = position
    @velocity = Vector2D[]
  end
end
