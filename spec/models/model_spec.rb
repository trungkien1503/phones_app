# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Model, type: :model do
  subject { build(:model, manufacturer: manufacturer) }

  let(:manufacturer) { create(:manufacturer) }

  it { is_expected.to be_valid }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_presence_of(:os_version) }
    it { is_expected.to validate_numericality_of(:year_of_manufacture) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:manufacturer) }
    it { is_expected.to have_many(:phones) }
  end
end
