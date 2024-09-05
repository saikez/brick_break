module Drawable
  attr_accessor :position, :image

  def draw
    @image.draw_rot(*@position)
  end

  def width
    @image.width
  end

  def height
    @image.height
  end
end
