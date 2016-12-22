require "rails_helper"

describe Manufacturer do
  """
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot

  Acceptance Criteria:
  - I must specify a manufacturer name and country.
  - If I do not specify the required information, I am presented with errors.
  - If I specify the required information, the manufacturer is recorded and I am redirected to the index of manufacturers
  """
  describe "new manufacturer" do
    it 'creates a new manufacturer' do
      visit new_manufacturer_path
      fill_in "Name", with: "Nissan"
      fill_in "Country", with: "Japan"
      click_button "Submit new manufacturer"

      expect(page).to have_content("Successfully")
    end

    it 'should show errors' do
      visit new_manufacturer_path
      click_button "Submit new manufacturer"

      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Country can't be blank")
    end
  end

  describe 'index page' do
    let!(:manufacturer) { Manufacturer.create(name: "Nissan", country: "Japan") }

    it 'should show all the manufacturers' do
      visit manufacturers_path
      expect(page).to have_content(manufacturer.name)
    end
  end
end