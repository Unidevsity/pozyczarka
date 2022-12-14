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

  private

  def invitation_params
    params.require(:invitation).permit(:email)
  end
end
