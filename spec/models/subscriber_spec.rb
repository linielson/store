require 'rails_helper'

RSpec.describe Subscriber, type: :model do
  it "is valid with valid attributes" do
    product = create(:product)
    subscriber = Subscriber.new(email: "test@example.com", product: product)
    expect(subscriber).to be_valid
  end
end