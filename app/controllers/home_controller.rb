class HomeController < ApplicationController

  def index
    @auctions = Auction.where("starts_at < ?",Time.current).where("ends_at > ?", Time.current)
    @auction_items = AuctionItem.where(auction_id: @auctions.pluck(:id)).where(is_bid_allowed: true)
    @non_auction_items = AuctionItem.where(auction_id: @auctions.pluck(:id)).where(is_bid_allowed: false)
  end
end
