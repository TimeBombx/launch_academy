class Zoo
  attr_reader :name, :season_opening_date, :season_closing_date, :employees, :cages

  def initialize(name, season_opening_date, season_closing_date)
    @name = name
    @season_opening_date = season_opening_date
    @season_closing_date = season_closing_date

    @cages = Array.new(10, Cage.new)
    @employees = Array.new
    @max_cages = 20
  end

  def open?(date)
    if ((season_opening_date <=> date) <= 0) && (season_closing_date <=> date) == 1
      return true
    end
    return false
  end

  def add_employee(employee)
    employees << employee
  end

  def add_animal(animal)
    raise ZooAtCapacity if cages.size >= @max_cages
    cages << Cage.new(animal)
  end

  def visit
    visit = ""
    @employees.each do |employee|
      visit += "#{employee.name} waved hello!\n"
    end
    @cages.each do |cage|
      visit += "#{cage.animal.speak}\n" unless cage.animal.nil?
    end
    visit
  end
end