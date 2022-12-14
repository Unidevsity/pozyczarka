class FriendsController < ApplicationController
  before_action :authenticate_user!
  def index
    @received_invitations = current_user.received_invitations
    @sent_invitations = current_user.sent_invitations
  end

  def show
  end
end
