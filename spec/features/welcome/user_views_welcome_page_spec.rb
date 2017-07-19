require 'rails_helper'

describe "User visits home page and" do
  scenario "sees the welcome message" do
    visit '/'

    expect(page).to have_content "Welcome to Activist"
  end
end

describe "User is on any page and" do
  scenario "clicks navbar link to home" do
    visit '/'

    click_link "Activist"

    expect(current_path).to eq '/'
  end

  scenario "clicks navbar link to Events" do
    visit '/'

    click_link "Events"

    expect(current_path).to eq '/events'
  end

  scenario "clicks navbar link to Groups" do
    visit '/'

    click_link "Groups"

    expect(current_path).to eq "/groups"
  end

  scenario "clicks navbar link to Interests" do
    visit '/'

    click_link "Interests"

    expect(current_path).to eq "/interests"
  end
end
