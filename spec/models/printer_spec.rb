require 'rails_helper'

RSpec.describe Printer, type: :model do
  it "has a valid factory" do
    expect(build(:printer)).to be_valid
  end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:kind) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:department) }

  it { should belong_to(:department) }
end
