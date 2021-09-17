class HomeController < ApplicationController

  def index
    @auctions = Auction.where("starts_at > ?",Time.now)
    @auction_items = AuctionItem.all
  end
end
