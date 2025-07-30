# Acme Widget Co. Basket Implementation

This repository contains a Ruby implementation of the Acme Widget Co. shopping basket, as described in the coding assessment.

## How It Works

The solution is designed with extensibility and separation of concerns in mind, using several key design patterns:

*   **Strategy Pattern:** Delivery charges and special offers are implemented as strategies. This means you can easily add new rules or offers without modifying the core basket logic. New delivery rules can be added by creating a new class that inherits from `DeliveryChargeRule`, and new offers by inheriting from `Offer`.

*   **Dependency Injection:** The `Basket` class is initialized with a product catalog, delivery rules, and offers. This makes it highly configurable and easy to test with different setups.

*   **Factory Pattern:** The `AcmeWidgetFactory` class provides a convenient way to create a basket with the default Acme Widget Co. configuration. This simplifies the setup process for the standard use case.

### File Structure

*   `lib/`: Contains the core logic for the basket system.
    *   `product.rb`: Defines the `Product` class.
    *   `delivery_charge_rule.rb`: Defines the strategy for delivery charges.
    *   `offer.rb`: Defines the strategy for special offers.
    *   `basket.rb`: The main `Basket` class.
    *   `acme_widget_factory.rb`: A factory to create the default basket configuration.
*   `test_basket.rb`: A script to run the test cases provided in the assessment.
*   `example.rb`: A script that demonstrates how to use the basket.

## How to Run

1.  **Run the tests:**

    ```bash
    ruby test_basket.rb
    ```

2.  **See an example in action:**

    ```bash
    ruby example.rb
    ```

## Assumptions

*   **Floating-point precision:** The calculations involve floating-point numbers, so there might be minor rounding differences (e.g., $98.27 vs. $98.28). The test script handles this by allowing a small tolerance.

*   **Delivery costs on discounted total:** I've assumed that delivery charges are calculated based on the subtotal *after* any special offer discounts have been applied. This was clarified during the debugging process to match the expected test case outputs.

*   **Extensibility over simplicity:** The solution is designed to be easily extensible. While a simpler implementation is possible, this approach using strategies and dependency injection is more robust and scalable for future requirements.
