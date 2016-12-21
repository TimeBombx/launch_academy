require "rails_helper"

describe Car do
  """
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot

  Acceptance Criteria:
  - I must specify the manufacturer, color, year, and mileage of the car (an association between the car and an existing manufacturer should be created).
  - Only years from 1920 and above can be specified.
  - I can optionally specify a description of the car.
  - If I enter all of the required information in the required formats, the car is recorded and I am presented with a notification of success.
  - If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
  - Upon successfully creating a car, I am redirected back to the index of cars.
  """
  describe "new car" do
    it 'creates a new car' do
      visit new_car_path
      fill_in "year", 2012
      fill_in "model", "Altima"
      fill_in "mileage", "4000"
      fill_in "color", "black"
      click "Submit new car"

      expect(page).to have_content("Successfully")
    end

    it 'should show errors' do

    end
  end
end