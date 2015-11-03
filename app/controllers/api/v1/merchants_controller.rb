class Api::V1::MerchantsController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find(id: params[:id])
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
    merchant = Merchant.find_by(id: params[:merchant_id])
    respond_with merchant.items
  end

  def invoices
    merchant = Merchant.find_by(id: params[:merchant_id])
    respond_with merchant.invoices
  end

  private

  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
