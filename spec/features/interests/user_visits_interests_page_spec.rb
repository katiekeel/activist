require 'rails_helper'

describe "User visits all interests" do
  scenario "and sees their names" do
    interest = create(:interest)

    visit interests_path

    expect(page).to have_link(interest.name)
  end

  scenario "and clicks link to see an interest" do
    interest = create(:interest)

    visit interests_path

    click_link "#{interest.name}"

    expect(current_path).to eq "/interests/#{interest.id}"
  end
end
