require 'rails_helper'

RSpec.describe Department, type: :model do
  it "has a valid factory" do
    expect(build(:department)).to be_valid
  end

  it { should validate_presence_of(:name)}
end
