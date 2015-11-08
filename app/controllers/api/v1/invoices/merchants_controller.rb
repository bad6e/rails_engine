class Api::V1::Invoices::MerchantsController < Api::V1::MerchantsController

  def show
    respond_with Merchant.for_invoice(params["id"])
  end
end