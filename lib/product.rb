# frozen_string_literal: true

class Product
  attr_reader :code, :price

  def initialize(code, price)
    @code = code
    @price = price
  end

  def ==(other)
    other.is_a?(Product) && code == other.code && price == other.price
  end

  def hash
    [code, price].hash
  end

  alias eql? ==
end
