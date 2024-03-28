require 'rails_helper'

RSpec.describe Herb, type: :model do
  it 'is valid with valid attributes' do
    herb = Herb.new(name: 'Test Herb', watered: 'yes')
    expect(herb).to be_valid
  end

  it 'is not valid without a name attribute' do
    herb = Herb.new(watered: 'yes')
    expect(herb).not_to be_valid
    expect(herb.errors[:name]).to include("can't be blank")
  end

  it 'is not valid without a watered attribute' do
    herb = Herb.new(name: 'Test Herb')
    expect(herb).not_to be_valid
    expect(herb.errors[:watered]).to include("can't be blank")
  end
end
