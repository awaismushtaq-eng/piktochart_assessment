# frozen_string_literal: true

require_relative 'lib/acme_widget_factory'

def test_basket
  puts "Testing Acme Widget Co Basket Implementation\n"
  puts "=" * 50

  test_cases = [
    {
      products: %w[B01 G01],
      expected: 37.85,
      description: "Blue Widget + Green Widget"
    },
    {
      products: %w[R01 R01],
      expected: 54.37,
      description: "Two Red Widgets (with half-price offer)"
    },
    {
      products: %w[R01 G01],
      expected: 60.85,
      description: "Red Widget + Green Widget"
    },
    {
      products: %w[B01 B01 R01 R01 R01],
      expected: 98.27,
      description: "Two Blue Widgets + Three Red Widgets"
    }
  ]

  test_cases.each_with_index do |test_case, index|
    puts "\nTest Case #{index + 1}: #{test_case[:description]}"
    puts "Products: #{test_case[:products].join(', ')}"

    basket = AcmeWidgetFactory.create_basket
    test_case[:products].each { |product_code| basket.add(product_code) }

    actual_total = basket.total
    expected_total = test_case[:expected]

    puts "Expected: $#{'%.2f' % expected_total}"
    puts "Actual:   $#{'%.2f' % actual_total}"

    if (actual_total - expected_total).abs < 0.01
      puts "✅ PASS"
    else
      puts "❌ FAIL"
    end

    puts "-" * 30
  end
end

# Run tests if this file is executed directly
if __FILE__ == $0
  test_basket
end
