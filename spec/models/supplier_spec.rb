require 'rails_helper'

RSpec.describe Supplier, type: :model do
  it "is valid with valid attributes" do
    expect(Supplier.new(name: "Batata Supplier", address: "Lugar nenhum")).to be_valid
  end
  
  it "is invalid without attributes" do
    expect(Supplier.new).to_not be_valid
  end
  
  it "is invalid without a name" do
    expect(Supplier.new(address: "Lugar nenhum")).to_not be_valid
  end

  it "is invalid without a address" do
    expect(Supplier.new(name: "Batata Supplier")).to_not be_valid
  end
end
