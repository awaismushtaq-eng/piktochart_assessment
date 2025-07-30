# frozen_string_literal: true

class Offer
  def applicable?(_products)
    raise NotImplementedError
  end

  def apply(_products)
    raise NotImplementedError
  end
end

# Buy one red widget, get the second half price
class RedWidgetBuyOneGetSecondHalfPriceOffer < Offer
  def applicable?(products)
    red_widget_count(products) >= 2
  end

  def apply(products)
    red_widgets = products.select { |product| product.code == 'R01' }
    return 0 if red_widgets.size < 2

    # Calculate discount for pairs of red widgets
    pairs = red_widgets.size / 2
    discount_per_pair = red_widgets.first.price * 0.5
    pairs * discount_per_pair
  end

  private

  def red_widget_count(products)
    products.count { |product| product.code == 'R01' }
  end
end
