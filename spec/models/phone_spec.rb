# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Phone, type: :model do
  subject { build(:phone, model: model) }

  let(:manufacturer) { create(:manufacturer) }
  let(:model) { create(:model, manufacturer: manufacturer) }

  it { is_expected.to be_valid }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:body_color) }
    it { is_expected.to validate_presence_of(:data_memory) }
    it { is_expected.to validate_numericality_of(:price) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:model) }
    it { is_expected.to have_many(:inventories) }
  end
end
