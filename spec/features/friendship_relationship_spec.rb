describe 'Friendship relation' do
  let(:user) { create(:user) }
  # dodawanie znajomych
  # wyświetlanie listy znajomych

  describe 'add friend' do
    let(:friend) { create(:user) }

    it 'can add new friend' do
      user.friends << friend
      user.save!
      expect(user.reload.friends.last).to eq friend
    end
  end

  describe 'friends list' do
    let(:friends) { create_list(:user, 5) }

    it 'list friends for user' do
      friends.each do |friend|
        user.friends << friend
      end
      user.save
      expect(user.friends.count).to eq friends.count
      expect(user.friends.pluck(:id)).to eq friends.pluck(:id)
    end
  end
end
