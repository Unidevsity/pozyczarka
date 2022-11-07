# frozen_string_literal: true

describe ItemsController do
  describe 'GET #index' do
    subject(:index_request) { get :index }

    it 'returns http success' do
      index_request
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index template' do
      index_request
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    subject(:show_request) { get :show, params: { id: item.id } }

    let(:item) { create(:item) }

    it 'returns http success' do
      show_request
      expect(response).to have_http_status(:ok)
    end

    it 'render the show template' do
      show_request
      expect(response).to render_template('show')
    end
  end

  describe 'GET #new' do
    subject(:new_request) { get :new }

    it 'returns http success' do
      new_request
      expect(response).to have_http_status(:ok)
    end

    it 'render the new template' do
      new_request
      expect(response).to render_template('new')
    end
  end

  describe 'GET #edit' do
    subject(:edit_request) { get :edit, params: { id: item.id } }

    let(:item) { create(:item) }

    it 'returns http success' do
      edit_request
      expect(response).to have_http_status(:ok)
    end

    it 'renders the edit template' do
      edit_request
      expect(response).to render_template('edit')
    end
  end

  describe 'POST #create' do
    subject(:create_request) { post :create, params: { item: item.attributes } }

    let(:item) { build(:item) }

    it 'returns http redirect' do
      create_request
      expect(response).to have_http_status(:found)
    end

    it 'redirects to the new item' do
      create_request
      expect(response).to redirect_to(item_path(Item.last))
    end

    it 'creates a new item' do
      expect { create_request }.to change(Item, :count).by(1)
    end
  end

  describe 'PUT #update' do
    subject(:update_request) { put :update, params: { id: item.id, item: new_attributes } }

    let(:item) { create(:item) }
    let(:new_attributes) { attributes_for(:item) }

    it 'returns http redirect' do
      update_request
      expect(response).to have_http_status(:found)
    end

    it 'redirects to updated item' do
      update_request
      expect(response).to redirect_to(item_path(item))
    end

    it 'updates the item' do
      expect { update_request }.to change { item.reload.name }.to(new_attributes[:name])
    end
  end

  describe 'DELETE #destroy' do
    subject(:destroy_request) { delete :destroy, params: { id: item.id } }

    let!(:item) { create(:item) }

    it 'returns https redirect' do
      destroy_request
      expect(response).to have_http_status(:found)
    end

    it 'redirects to the items index' do
      destroy_request
      expect(response).to redirect_to(items_path)
    end

    it 'deletes the item' do
      expect { destroy_request }.to change(Item, :count).by(-1)
    end
  end

  describe 'GET #active' do
    subject(:active_request) { get :active }

    it 'returns http success' do
      active_request
      expect(response).to have_http_status(:ok)
    end

    it 'renders the active template' do
      active_request
      expect(response).to render_template('active')
    end
  end

  describe 'GET #inactive' do
    subject(:inactive_request) { get :inactive }

    it 'returns http success' do
      inactive_request
      expect(response).to have_http_status(:ok)
    end

    it 'renders inactive template' do
      inactive_request
      expect(response).to render_template('inactive')
    end
  end

  describe 'GET #borrowed' do
    subject(:borrowed_request) { get :borrowed }

    it 'returns http success' do
      borrowed_request
      expect(response).to have_http_status(:ok)
    end

    it 'render borrowed template' do
      borrowed_request
      expect(response).to render_template('borrowed')
    end
  end

  describe 'GET #on_place' do
    subject(:on_place_request) { get :on_place }

    it 'returns http success' do
      on_place_request
      expect(response).to have_http_status(:ok)
    end

    it 'renders on place template' do
      on_place_request
      expect(response).to render_template('on_place')
    end
  end
end
