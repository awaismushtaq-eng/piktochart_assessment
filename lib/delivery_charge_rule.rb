# frozen_string_literal: true

class DeliveryChargeRule
  def applicable?(_subtotal)
    raise NotImplementedError
  end

  def charge
    raise NotImplementedError
  end
end

# Rule for orders under $50
class Under50Rule < DeliveryChargeRule
  def applicable?(subtotal)
    subtotal < 50
  end

  def charge
    4.95
  end
end

# Rule for orders under $90
class Under90Rule < DeliveryChargeRule
  def applicable?(subtotal)
    subtotal < 90
  end

  def charge
    2.95
  end
end

# Rule for orders of $90 or more
class Over90Rule < DeliveryChargeRule
  def applicable?(subtotal)
    subtotal >= 90
  end

  def charge
    0.00
  end
end
