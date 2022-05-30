class AddIsBidAllowedInAuctionItem < ActiveRecord::Migration[6.1]
  def change
    add_column :auction_items, :is_bid_allowed, :boolean
  end
end
