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
    let!(:manufacturer) { Manufacturer.create(name: "Nissan", country: "Japan") }

    it 'creates a new car' do
      visit new_car_path
      fill_in "Year", with: 2012
      fill_in "Model", with: "Altima"
      fill_in "Mileage", with: "4000"
      fill_in "Color", with: "black"
      click_button "Submit new car"

      expect(page).to have_content("Successfully")
    end

    it 'should show errors when submitting a blank form' do
      visit new_car_path
      click_button "Submit new car"

      expect(page).to have_content("Year can't be blank")
      expect(page).to have_content("Year is not a number")
      expect(page).to have_content("Color can't be blank")
      expect(page).to have_content("Model can't be blank")
      expect(page).to have_content("Mileage can't be blank")
    end

    it "shouldn't allow a car before 1920 create" do
      visit new_car_path
      fill_in "Year", with: 1919
      fill_in "Model", with: "Altima"
      fill_in "Mileage", with: "4000"
      fill_in "Color", with: "black"
      click_button "Submit new car"

      expect(page).to have_content("Year must be greater than or equal")
    end

    it 'should return to index after creating a car' do
      visit new_car_path
      fill_in "Year", with: 2012
      fill_in "Model", with: "Altima"
      fill_in "Mileage", with: "4000"
      fill_in "Color", with: "black"
      click_button "Submit new car"

      expect(current_path).to eq(cars_path)
    end
  end

  describe 'index page' do
    let!(:manufacturer) { Manufacturer.create(name: "Nissan", country: "Japan") }
    let!(:car) { Car.create!(model: "Altima", year: 1995, color: "black", mileage: 182000, manufacturer_id: manufacturer.id) }

    it 'should show all the manufacturers' do
      visit cars_path
      expect(page).to have_content(car.info)
    end
  end
end