class AuctionItemsController < ApplicationController

  def show
    @auction_item = AuctionItem.where(id: params[:id]).first

    return redirect_to root_path if Time.now > @auction_item.auction.ends_at
    
    @bid = @auction_item.bids.build
  end
end
