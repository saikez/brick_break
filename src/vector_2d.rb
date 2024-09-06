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

  def distance_to(other)
    Math.sqrt(sqr_distance_to(other))
  end

  def sqr_distance_to(other)
    (other.x - x)**2 + (other.y - y)**2
  end

  def reflect(normal)
    n = normal.normalize

    self - (2 * dot(n) * n)
  end

  def reflect!(normal)
    reflected_self = reflect(normal)

    self.x = reflected_self.x
    self.y = reflected_self.y

    self
  end

  def self.left
    Vector2D[-1.0, 0.0]
  end

  def self.right
    Vector2D[1.0, 0.0]
  end

  def self.up
    Vector2D[0.0, -1.0]
  end

  def self.down
    Vector2D[0.0, 1.0]
  end
end
