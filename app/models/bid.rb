class Bid < ApplicationRecord
  belongs_to :auction_item

  def approve
    bids =  auction_item.bids
    bids.where.not(id: self.id).update_all(status: 'rejected')
    update(status: 'approved')
    auction_item.update(current_bid_amount: bid_amount)
  end
end
