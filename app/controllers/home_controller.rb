class HomeController < ApplicationController

  def index
    @auctions = Auction.where("starts_at > ?".Time.now)
    @auction_items = AuctionItem.where(auction: @auctions)
  end
end
