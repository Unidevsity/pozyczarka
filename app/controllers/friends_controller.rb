class FriendsController < ApplicationController
  before_action :authenticate_user!
  def index
    @received_invitations = current_user.received_invitations.not_processed
    @sent_invitations = current_user.sent_invitations
    @friends = current_user.friends
  end

  def show
    friend
    redirect_to action: :items
  end

  def items
    friend
  end

  def chat
    friend
  end

  private

  def friend
    @friend ||= current_user.friends.find(params[:id])
  end
end
