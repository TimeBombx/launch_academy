require "spec_helper"

feature "user deletes grocery item" do
  scenario "successfully deletes grocery item" do
    visit "/groceries"
    fill_in "Name", with: "Peanut Butter"
    click_button "Submit"

    visit "/groceries"
    click_button "delete"

    expect(page).to_not have_content "Peanut Butter"
  end
end
