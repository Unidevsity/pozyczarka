module InvitationsHelper

  def invitation_status_class(invitation)
    status_class = case invitation.state
                   when 'pending' then 'muted'
                   when 'accepted' then 'success'
                   when 'rejected' then 'danger'
                   end
    ["card-subtitle", "text-#{status_class}"].join(' ')
  end
end
