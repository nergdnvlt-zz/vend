require 'rails_helper'

describe 'Machine' do
  it 'calculates average price for machine' do
    owner = Owner.create!(name: "Sam's Snacks")
    dons  = owner.machines.create!(location: "Don's Mixed Drinks")
    dons.snacks.create!(name: 'Snickers', price: 2.0)
    dons.snacks.create!(name: 'M&M', price: 1.0)
    
    expect(dons.average_price).to eq(1.50)
  end
end
