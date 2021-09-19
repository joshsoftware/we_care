class BidsController < ApplicationController

  def create
    Bid.create(bid_params)
    redirect_to root_path
  end

  private

  def bid_params
    params.require(:bid).permit(:email, :mobile, :bid_amount, :auction_item_id)
  end
end
