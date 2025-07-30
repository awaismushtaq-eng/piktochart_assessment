# frozen_string_literal: true

require_relative 'lib/acme_widget_factory'

puts "Acme Widget Co. Basket Example"
puts "=" * 40

basket = AcmeWidgetFactory.create_basket

puts "\nExample 1: Blue Widget + Green Widget"
basket.add('B01')
basket.add('G01')
puts "Total: $#{'%.2f' % basket.total}"

puts "\nExample 2: Two Red Widgets (second one half price)"
basket2 = AcmeWidgetFactory.create_basket
basket2.add('R01')
basket2.add('R01')
puts "Total: $#{'%.2f' % basket2.total}"

puts "\nExample 3: Large order (free delivery)"
basket3 = AcmeWidgetFactory.create_basket
basket3.add('R01')
basket3.add('R01')
basket3.add('R01')
puts "Total: $#{'%.2f' % basket3.total}"

puts "\nExample 4: Custom basket (no offers, different delivery rules)"
catalog = AcmeWidgetFactory.create_catalog
custom_delivery_rules = [AcmeWidgetFactory.create_delivery_rules.first] # Only free delivery for $90+
custom_basket = Basket.new(catalog, custom_delivery_rules, [])

custom_basket.add('B01')
custom_basket.add('G01')
puts "Custom basket total (no standard delivery charges): $#{'%.2f' % custom_basket.total}"
