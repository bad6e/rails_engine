class Api::V1::Items::InvoiceItemsController < Api::V1::InvoiceItemsController

  def index
    respond_with InvoiceItem.invoice_items_for_item(params[:item_id])
  end
end
