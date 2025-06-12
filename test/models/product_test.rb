require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "product should be valid" do
    product = Product.new(name: "Sample Product")
    assert product.valid?
  end

  test "product name should be present" do
    product = Product.new(name: "")
    assert_not product.valid?
  end
end
