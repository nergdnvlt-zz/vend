require 'rails_helper'

describe 'snack show page' do
  scenario 'they see the snack name' do
    owner = Owner.create!(name: "Sam's Snacks")
    dons  = owner.machines.create!(location: "Don's Mixed Drinks")
    snack = dons.snacks.create!(name: 'Snickers', price: 2.0)

    visit snack_path(snack)

    expect(page).to have_content(snack.name)
  end

  scenario 'they see the snack price' do
    owner = Owner.create!(name: "Sam's Snacks")
    dons  = owner.machines.create!(location: "Don's Mixed Drinks")
    snack = dons.snacks.create!(name: 'Snickers', price: 2.0)

    visit snack_path(snack)

    expect(page).to have_content(snack.price)
  end

  scenario 'they see the snack locations' do
    owner = Owner.create!(name: "Sam's Snacks")
    dons  = owner.machines.create!(location: "Don's Mixed Drinks")
    snack = dons.snacks.create!(name: 'Snickers', price: 2.0)

    visit snack_path(snack)

    expect(page).to have_content(dons.location)
  end
end
