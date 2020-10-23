# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Manufacturer, type: :model do
  subject { build(:manufacturer) }

  it { is_expected.to be_valid }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
