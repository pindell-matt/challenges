require 'rails_helper'

describe Merchant do
  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
  end
end
