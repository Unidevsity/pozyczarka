class InvitationsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find_by_email(invitation_params[:email])
    if user
      Invitation.find_or_create_by!(invited_by_id: current_user.id, invited_id: user.id)
    else
      # TODO wysyłanie zaproszenia emailem
    end
    redirect_to friends_path
  end

  def accept
    invitation = current_user.received_invitations.find(params[:id])
    invitation.accept!
    if invitation.accepted?
      current_user.friends << invitation.inviting_user
      invitation.inviting_user.friends << current_user
    end
    redirect_to invitations_path
  end

  def reject
    invitation = current_user.received_invitations.find(params[:id])
    invitation.reject!
    redirect_to invitations_path
  end

  private

  def invitation_params
    params.require(:invitation).permit(:email)
  end
end
