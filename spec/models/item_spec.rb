require 'rails_helper'

RSpec.describe Item, type: :model do
  it "is valid with valid attributes" do
    client = Client.create(name: "Sr. Potato")
    product = Product.create(description: "French Fries", price: 2.50)
    supplier = Supplier.create(name: "Potato Corp", address: "Baked Street")
    order = Order.create
    expect(Item.new(client: client, product: product, supplier: supplier, order: order, quantity: 5)).to be_valid
  end

  it "is invalid without valid client" do
    product = Product.create(description: "French Fries", price: 2.50)
    supplier = Supplier.create(name: "Potato Corp", address: "Baked Street")
    order = Order.create
    expect(Item.new(product: product, supplier: supplier, order: order, quantity: 5)).to_not be_valid
  end

  it "is invalid without valid product" do
    client = Client.create(name: "Sr. Potato")
    supplier = Supplier.create(name: "Potato Corp", address: "Baked Street")
    order = Order.create
    expect(Item.new(client: client, supplier: supplier, order: order, quantity: 5)).to_not be_valid
  end

  it "is invalid without valid supplier" do
    client = Client.create(name: "Sr. Potato")
    product = Product.create(description: "French Fries", price: 2.50)
    order = Order.create
    expect(Item.new(client: client, product: product, order: order, quantity: 5)).to_not be_valid
  end

  it "is invalid without valid order" do
    client = Client.create(name: "Sr. Potato")
    product = Product.create(description: "French Fries", price: 2.50)
    supplier = Supplier.create(name: "Potato Corp", address: "Baked Street")
    expect(Item.new(client: client, product: product, supplier: supplier, quantity: 5)).to_not be_valid
  end

  
end
