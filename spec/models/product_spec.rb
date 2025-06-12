require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      product = Product.new(name: "Sample Product", inventory_count: 0)
      expect(product).to be_valid
    end

    it 'is not valid without a name' do
      product = Product.new(name: "")
      expect(product).not_to be_valid
    end
  end

  describe 'stock notifications' do
    it 'sends email notifications when back in stock' do
      product = create(:product, inventory_count: 0)
      
      # Create subscribers for this product
      create_list(:subscriber, 2, product: product)
      
      # Update inventory to trigger notifications
      expect {
        product.update(inventory_count: 99)
      }.to change { ActionMailer::Base.deliveries.count }.by(2)
    end
  end
end