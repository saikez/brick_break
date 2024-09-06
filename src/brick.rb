# frozen_string_literal: true

require 'gosu'
require_relative 'vector_2d'
require_relative 'mixins/drawable'
require_relative 'mixins/collidable'

# A literal brick
#
class Brick
  include Drawable
  include Collidable

  def initialize(position: Vector2D[], brick_image: nil)
    brick_image = brick_blue.png if brick_image.nil?
    brick_image_path = "assets/images/bricks/#{brick_image}"
    @image = Gosu::Image.new(brick_image_path || 'assets/images/bricks/brick_blue.png')
    @position = position
    @collidable = true
  end

  def self.dimensions
    sample_brick = Gosu::Image.new('assets/images/bricks/brick_blue.png')

    { width: sample_brick.width, height: sample_brick.height }
  end

  def on_collision(_other)
    self
  end
end
