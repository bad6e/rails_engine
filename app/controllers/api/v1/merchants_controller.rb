class Api::V1::MerchantsController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find(params[:id])
  end

  def find
    respond_with Merchant.find_by(merchant_params)
  end

  def find_all
    respond_with Merchant.where(merchant_params)
  end

  def random
    respond_with Merchant.limit(1).order("RANDOM()")
  end

  def items
    respond_with find_merchant.items
  end

  def invoices
    respond_with find_merchant.invoices
  end

  def revenue
    if params[:date]
      respond_with revenue: find_merchant.date_revenue(params[:date])
    else
      respond_with revenue: find_merchant.total_revenue
    end
  end

  def most_revenue
    respond_with Merchant.most_revenue(params["quantity"])
  end

  def customers_with_pending_invoices
    respond_with find_merchant.pending
  end

  def favorite_customer
    customer = find_merchant.transactions.where(result: "success").map {|r| r.invoice.customer}
    id = customer.max_by{|x| customer.count(x)}.id
    respond_with Customer.find(id)
  end

  private

  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end

  def find_merchant
    Merchant.find_by(id: params[:merchant_id])
  end
end
