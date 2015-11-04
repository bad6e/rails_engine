class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :credit_card_number, :invoice_id, :result, :updated_at
  belongs_to :invoice_id
end
