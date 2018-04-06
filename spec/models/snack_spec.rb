require 'rails_helper'

RSpec.describe Snack, type: :model do
  describe 'Validations' do
    it { validate_presence_of :name }
    it { validate_presence_of :price }
  end

  describe 'Relationships' do
    it { should belong_to(:machine) }
  end
end
