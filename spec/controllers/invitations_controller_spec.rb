describe InvitationsController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe '#create' do
    let(:params) {{
      invitation: { email: email }
    }}

    subject(:create_request) { post :create, params: params }

    context 'when user exists' do
      let!(:friend) { create(:user) }
      let(:email) { friend.email }

      it 'creates invitation' do
        expect { create_request }.to change(Invitation, :count).by(1)
      end
    end

    context 'when user does not exist' do
      let(:email) { 'sample@mea.copm' }

      it 'does not create invitation' do
        expect { create_request }.not_to change(Invitation, :count)
      end
    end

    context 'when invitation already sent' do
      let(:friend) { create(:user) }
      let(:email) { friend.email }

      it 'does not create duplicate invitation' do
        Invitation.create!(invited_id: friend.id, invited_by_id: user.id)
        expect { create_request }.not_to change(Invitation, :count)
      end
    end
  end
end
