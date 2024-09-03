require 'matrix'

class Vector2D < Vector
  def self.[](*args)
    if args.empty?
      Vector2D.zero(2)
    elsif args.length != 2
      raise ArgumentError, "wrong number of arguments (given #{args.length}, expected 2)"
    else
      super(*args)
    end
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

  def x_add(value)
    self.x += value
  end

  def x_subtract(value)
    self.x -= value
  end

  def x_multiply(value)
    self.x *= value
  end

  def x_divide(value)
    self.x /= value
  end

  def y_add(value)
    self.y += value
  end

  def y_subtract(value)
    self.y -= value
  end

  def y_multiply(value)
    self.x *= value
  end

  def y_divide(value)
    self.x /= value
  end

  def +(other)
    raise TypeError, 'Expected Vector2D' unless other.is_a?(Vector2D)

    Vector2D[self.x + other.x, self.y + other.y]
  end

  def -(other)
    raise TypeError, 'Expected Vector2D' unless other.is_a?(Vector2D)

    Vector2D[self.x - other.x, self.y - other.y]
  end

  def *(scalar)
    Vector2D[self.x * scalar, self.y * scalar]
  end

  def /(scalar)
    raise ZeroDivisionError, 'Division by zero' if scalar.zero?

    Vector2D[self.x / scalar, self.y / scalar]
  end
end
