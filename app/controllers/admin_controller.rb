class AdminController < ApplicationController
  include HttpAuthConcern

  def index
    @auction_items = AuctionItem.includes(:bids).all
  end
end
