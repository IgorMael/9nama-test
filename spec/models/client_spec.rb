require 'rails_helper'

RSpec.describe Client, type: :model do
  it "is valid with valid attributes" do
    expect(Client.new(name: "Sr. Batata")).to be_valid
  end
  
  it "is invalid without a name" do
    expect(Client.new).to_not be_valid
  end
end
