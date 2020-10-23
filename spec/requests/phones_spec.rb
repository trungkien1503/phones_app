require 'rails_helper'

RSpec.describe "Phones", type: :request do
  let(:manufacturer) { create(:manufacturer) }
  let(:model) { create(:model, manufacturer: manufacturer) }
  let(:phone) { create(:phone, model: model) }

  describe 'GET #index' do
    it 'returns successfuly' do
      get phones_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #new' do
    it 'returns successfuly' do
      get new_phone_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #edit' do
    it 'returns successfuly' do
      get edit_phone_path(phone)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:phone_params) do
        {
          body_color: 'white',
          data_memory: 64,
          price: 1000,
          model_id: model.id,
        }
      end

      it 'creates a new phone' do
        post phones_path, params: { phone: phone_params }
        expect(response).to redirect_to phone_path(Phone.last)
      end
    end

    context 'with invalid parameters' do
      it 'returns an bad_request' do
        post phones_path, params: {}
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe 'DELETE /phones/:id' do
    it 'returns successfuly' do
      delete phone_path(phone)
      expect(response).to redirect_to phones_path
    end
  end
end
