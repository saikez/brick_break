module GameMath
  class Vector2D
    def initialize(x_value = 0.0, y_value = 0.0)
      @x = x_value
      @y = y_value
    end

    def =(vector)
      @x = vector.x
      @y = vector.y
    end

    def dot(vector)
      (@x * vector.x) + (@y * vector.y)
    end

    def magnitude
      Math.sqrt(magnitude_squared)
    end

    alias :magnitude, :length

    def magnitude_squared
      @x**2 + @y**2
    end

    alias :magnitude_squared, :length_squared

    def normalize
      Vector2D.new(@x / magnitude, @y / magnitude)
    end

    def normalize!
      @x /= magnitude
      @y /= magnitude
    end

    def is_normalized?
      length == 1
    end

    def scale_to_length(length)
      normalize
      @x *= length
      @y *= length
    end

    def reflect
      # 𝑟=𝑑−2(𝑑⋅𝑛)𝑛
      # where 𝑑⋅𝑛 is the dot product, and 𝑛 must be normalized.
    end

    def reflect!
      = reflect
    end
  end

  def clamp(value, min, max)
    return min if value < min
    return max if value > max

    value
  end

  def lerp(a_value, b_value, weight)
    a_value + (b_value - a_value) * weight
  end
end
