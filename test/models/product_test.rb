require "test_helper"

class ProductTest < ActiveSupport::TestCase
  include ActionMailer::TestHelper

  test "product should be valid" do
    product = Product.new(name: "Sample Product", inventory_count: 0)
    assert product.valid?
  end

  test "product name should be present" do
    product = Product.new(name: "")
    assert_not product.valid?
  end

  test "sends email notifications when back in stock" do
    product = products(:tshirt)

    # Set product out of stock
    product.update(inventory_count: 0)

    assert_emails 2 do
      product.update(inventory_count: 99)
    end
  end
end
