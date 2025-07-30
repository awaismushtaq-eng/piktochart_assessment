# frozen_string_literal: true

require_relative 'product'
require_relative 'delivery_charge_rule'
require_relative 'offer'
require_relative 'basket'

class AcmeWidgetFactory
  def self.create_catalog
    {
      'R01' => Product.new('R01', 32.95),
      'G01' => Product.new('G01', 24.95),
      'B01' => Product.new('B01', 7.95)
    }
  end

  def self.create_delivery_rules
    [
      Over90Rule.new,    # Free delivery for $90+
      Under50Rule.new,   # $4.95 for under $50 (must be before Under90Rule)
      Under90Rule.new    # $2.95 for under $90 (but not under $50)
    ]
  end

  def self.create_offers
    [
      RedWidgetBuyOneGetSecondHalfPriceOffer.new
    ]
  end

  def self.create_basket
    Basket.new(create_catalog, create_delivery_rules, create_offers)
  end
end
