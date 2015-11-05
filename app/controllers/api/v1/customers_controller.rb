class Api::V1::CustomersController < ApplicationController
  respond_to :json

  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find(params[:id])
  end

  def find
    respond_with Customer.find_by(customer_params)
  end

  def find_all
    respond_with Customer.where(customer_params)
  end

  def random
    respond_with Customer.limit(1).order("RANDOM()")
  end

  def invoices
    respond_with find_customers.invoices
  end

  def transactions
    respond_with find_customers.transactions
  end

  def favorite_merchant
    respond_with find_customers.favorite_merchant
  end

  private

  def customer_params
    params.permit(:id,
                  :first_name,
                  :last_name,
                  :created_at,
                  :updated_at)
  end

  def find_customers
    Customer.find_by(id: params[:customer_id])
  end
end
