class AuctionItem < ApplicationRecord
  has_many :item_attachments
  belongs_to :user
  belongs_to :auction
end
