require "rails_helper"

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
  end

  describe 'class methods' do
    it '.get_key' do
      new_key = User.get_key

      expect(new_key).to be_an_instance_of(String)
      expect(new_key.length).to eq(24)
    end
  end
end
