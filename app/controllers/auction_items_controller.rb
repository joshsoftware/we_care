class AuctionItemsController < ApplicationController

  def show
    @auction_item = AuctionItem.where(id: params[:id]).first
    @bid = @auction_item.bids.build
  end
end
