require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario 'they see the item snack info for that machine' do
    owner = Owner.create!(name: "Sam's Snacks")
    dons  = owner.machines.create!(location: "Don's Mixed Drinks")
    snack1 = dons.snacks.create!(name: 'Snickers', price: 2)
    snack2 = dons.snacks.create!(name: 'M&M', price: 1)

    visit machine_path(dons)

    expect(page).to have_content(snack1.name)
    expect(page).to have_content(snack1.price)
    expect(page).to have_content(snack2.name)
    expect(page).to have_content(snack2.price)
  end

  scenario 'they see the item snacks average price for that machine' do
    owner = Owner.create!(name: "Sam's Snacks")
    dons  = owner.machines.create!(location: "Don's Mixed Drinks")
    dons.snacks.create!(name: 'Snickers', price: 2.0)
    dons.snacks.create!(name: 'M&M', price: 1.0)

    visit machine_path(dons)

    expect(page).to have_content('Average Price: $1.5')
  end
end
