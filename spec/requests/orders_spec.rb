require 'rails_helper'

RSpec.describe "Orders", type: :request do
  describe "GET /orders" do
    it "works! (now write some real specs)" do
      get orders_path
      expect(response).to have_http_status(200)
    end
  end

  describe "get /show" do
    it "should render a valid order" do
      order = Order.create
      get "/orders/1"
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end
  end
end
