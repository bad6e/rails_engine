class Api::V1::InvoiceItems::ItemsController < Api::V1::ItemsController

  def show
    respond_with Item.for_invoice_item(params["id"])
  end
end