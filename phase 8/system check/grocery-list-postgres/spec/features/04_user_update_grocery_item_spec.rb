require "spec_helper"

feature "user updates grocery item" do
  scenario "successfully updates grocery item" do
    visit "/groceries"
    fill_in "Name", with: "Peanut Butter"
    click_button "Submit"

    visit "/groceries"
    click_link "update"
    fill_in "name", with: "Peanut Butter2"
    click_button "Submit"

    expect(page).to have_content "Peanut Butter2"
  end

  scenario "submits update form without name" do
    visit "/groceries"
    fill_in "Name", with: "Peanut Butter"
    click_button "Submit"

    visit "/groceries"
    click_link "update"
    fill_in "name", with: ""
    click_button "Submit"

    expect(page).to have_content "Peanut Butter"
  end
end
