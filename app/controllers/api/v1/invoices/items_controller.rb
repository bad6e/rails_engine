class Api::V1::Invoices::ItemsController < Api::V1::ItemsController

  def index
    respond_with Item.for_invoices(params[:invoice_id])
  end
end
