class Api::V1::Transactions::InvoicesController < Api::V1::InvoicesController

  def show
    respond_with Invoice.for_transaction(params["id"])
  end
end