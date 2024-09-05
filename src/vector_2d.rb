require 'matrix'

class Vector2D < Vector
  def self.[](*args)
    return Vector2D.zero(2) if args.empty?
    raise ArgumentError, "wrong number of arguments (given #{args.length}, expected 2)" if args.length != 2

    super(*args)
  end

  def x
    @elements[0]
  end

  def x=(value)
    @elements[0] = value
  end

  def y
    @elements[1]
  end

  def y=(value)
    @elements[1] = value
  end

  def clamp_x(min, max)
    self.x = min if x < min
    self.x = max if x > max
  end

  def clamp_y(min, max)
    self.y = min if y < min
    self.y = max if y > max
  end

  def clamp(min_vector, max_vector)
    raise TypeError, 'Expected Vector2D' unless min_vector.is_a?(Vector2D) && max_vector.is_a?(Vector2D)

    clamp_x(min_vector.x, max_vector.x)
    clamp_y(min_vector.y, max_vector.y)
  end
end
