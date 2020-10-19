require 'rails_helper'

RSpec.describe Product, type: :model do
  it "is valid with valid attributes" do
    expect(Product.new(description: "Batata", price: 5.0)).to be_valid
  end

  it "is invalid without attributes" do
    expect(Product.new).to_not be_valid
  end
  
  it "is invalid without a description" do
    expect(Product.new(price: 5.0)).to_not be_valid
  end

  it "is invalid without a price" do
    expect(Product.new(description: "Batata")).to_not be_valid
  end
end
