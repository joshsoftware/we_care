class AuctionItem < ApplicationRecord
  has_many :item_attachments
  has_many :bids
  belongs_to :user
  belongs_to :auction
end
