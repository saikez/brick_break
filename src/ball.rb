# frozen_string_literal: true

require 'gosu'
require_relative 'vector_2d'
require_relative 'mixins/drawable'
require_relative 'mixins/collidable'

# Boing
#
class Ball
  include Drawable
  include Collidable
  attr_accessor :velocity, :speed

  def initialize(position: Vector2D[])
    @image = Gosu::Image.new('assets/images/ball.png')
    @position = position
    @speed = 10
    @velocity = Vector2D[]
  end

  def update
    if @collision_normal
      @velocity.reflect!(@collision_normal)
      @collision_normal = nil
    end
    @position += @velocity
  end

  def launch
    @velocity = Vector2D[-0.5, -0.5] * @speed
  end

  def collides_with?(other)
    if other.collidable? &&
       @position.x >= other.left - half_width &&
       @position.x <= other.right + half_width &&
       @position.y >= other.top - half_height &&
       @position.y <= other.bottom + half_height
      if (@position.x < other.left || @position.x > other.right) &&
         (@position.y < other.top || @position.y > other.bottom)
        point = closest_corner(other)

        return false unless @position.distance_to(point) <= half_width

        @collision_normal = calculate_collision_normal(point - @position)

        return true
      end

      @collision_normal = calculate_collision_normal(Vector2D.left) if @position.x <= other.left
      @collision_normal = calculate_collision_normal(Vector2D.right) if @position.x >= other.right
      @collision_normal = calculate_collision_normal(Vector2D.up) if @position.y <= other.top
      @collision_normal = calculate_collision_normal(Vector2D.down) if @position.y >= other.bottom

      true
    end
  end

  def calculate_collision_normal(normal)
    return (@collision_normal + normal) / 2 if @collision_normal

    normal
  end
end
