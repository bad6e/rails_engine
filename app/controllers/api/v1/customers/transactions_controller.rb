class Api::V1::Customers::TransactionsController < Api::V1::TransactionsController

  def index
    respond_with Transaction.transactions_for_customers(params[:customer_id])
  end
end
