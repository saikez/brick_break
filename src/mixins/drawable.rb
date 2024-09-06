# frozen_string_literal: true

module Drawable
  attr_accessor :position, :image

  def draw
    @image.draw_rot(*@position)
  end

  def width
    @image.width
  end

  def half_width
    width / 2.0
  end

  def height
    @image.height
  end

  def half_height
    height / 2.0
  end

  def corners
    [top_left, top_right, bottom_right, bottom_left]
  end

  def bottom_left
    Vector2D[@position.x - half_width, @position.y + half_height]
  end

  def bottom_right
    Vector2D[@position.x + half_width, @position.y + half_height]
  end

  def top_left
    Vector2D[@position.x - half_width, @position.y - half_height]
  end

  def top_right
    Vector2D[@position.x + half_width, @position.y - half_height]
  end

  def edges
    [top, right, bottom, left]
  end

  def top
    position.y - half_height
  end

  def right
    position.x + half_width
  end

  def bottom
    position.y + half_height
  end

  def left
    position.x - half_width
  end
end
