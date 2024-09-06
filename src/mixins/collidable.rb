# frozen_string_literal: true

# Make things hit other things!
#
module Collidable
  include Drawable
  attr_accessor :collidable, :collision_normal

  def collidable?
    !!@collidable
  end

  def collides_with?(_other)
    nil
  end

  def on_collision(_other)
    nil
  end

  def closest_corner(other)
    # Initialize the closest point as the first point in the array and the shortest distance
    closest = other.corners.first
    min_distance = @position.sqr_distance_to(closest)

    # Iterate through the rest of the points in the array
    other.corners.each do |point|
      distance = @position.sqr_distance_to(point)

      # If the current distance is smaller, update the closest point and min_distance
      if distance < min_distance
        closest = point
        min_distance = distance
      end
    end

    closest
  end
end
