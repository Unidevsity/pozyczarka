class RentalRequestsController < ApplicationController
  def accept
    rental_request.item.update!(borrowed_at: Time.now, borrowed_to_id: rental_request.user_id, borrowed: true)
    rental_request.destroy
    redirect_to item_path(rental_request.item)
  end

  def reject
    rental_request.destroy
    redirect_to item_path(rental_request.item)
  end

  private

  def rental_request
    @rental_request ||= RentalRequest.find(params[:id])
  end
end
