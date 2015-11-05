class Transaction < ActiveRecord::Base
  belongs_to :invoice
  has_many :customers, through: :invoice
end
