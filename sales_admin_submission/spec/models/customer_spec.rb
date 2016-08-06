require 'rails_helper'

describe Customer do
  context 'validations' do
    it { should validate_presence_of :name }
  end
end
