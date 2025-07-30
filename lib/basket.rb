# frozen_string_literal: true

require_relative 'product'
require_relative 'delivery_charge_rule'
require_relative 'offer'

class Basket
  attr_reader :products, :catalog, :delivery_rules, :offers

  def initialize(catalog, delivery_rules, offers = [])
    @catalog = catalog
    @delivery_rules = delivery_rules
    @offers = offers
    @products = []
  end

  def add(product_code)
    product = find_product(product_code)
    raise ArgumentError, "Product #{product_code} not found in catalog" unless product

    @products << product
  end

  def total
    subtotal = calculate_subtotal
    discount = calculate_discount
    delivery_charge = calculate_delivery_charge(subtotal - discount)

    subtotal - discount + delivery_charge
  end

  private

  def find_product(product_code)
    @catalog[product_code]
  end

  def calculate_subtotal
    @products.sum(&:price)
  end

  def calculate_discount
    @offers.sum do |offer|
      offer.applicable?(@products) ? offer.apply(@products) : 0
    end
  end

  def calculate_delivery_charge(discounted_subtotal)
    applicable_rule = @delivery_rules.find { |rule| rule.applicable?(discounted_subtotal) }
    applicable_rule ? applicable_rule.charge : 0
  end
end
