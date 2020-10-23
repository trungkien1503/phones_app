# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Inventory, type: :model do
  subject { build(:inventory, phone: phone, user: user) }

  let(:user) { create(:user) }
  let(:manufacturer) { create(:manufacturer) }
  let(:model) { create(:model, manufacturer: manufacturer) }
  let(:phone) { create(:phone, model: model) }

  it { is_expected.to be_valid }

  describe 'associations' do
    it { is_expected.to belong_to(:phone) }
    it { is_expected.to belong_to(:user) }
  end
end
