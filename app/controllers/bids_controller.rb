class BidsController < ApplicationController

  def create
    Bid.create(bid_params)
    redirect_to root_path
  end

  def update
    bid = Bid.where(id: params[:id]).first
    if bid && params[:bid][:status] == 'approved'
      bid.approve
    end
    redirect_to admin_index_path
  end

  private

  def bid_params
    params.require(:bid).permit(:name, :mobile, :bid_amount, :auction_item_id)
  end
end
