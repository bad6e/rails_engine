class Api::V1::Items::MerchantsController < Api::V1::MerchantsController

  def show
    respond_with Merchant.for_item(params["id"])
  end
end