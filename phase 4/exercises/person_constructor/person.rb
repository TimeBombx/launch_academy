class Person
  attr_reader :first_name, :last_name, :middle_name

  def initialize ( name, last_name = nil, middle_name = nil )
    full_name = name.split(" ")
    if (last_name.nil? && middle_name.nil?) || full_name.size > 2
      full_name = name.split(" ")
      @first_name = full_name[0]
      @last_name = full_name[1]
      @middle_name = full_name[2]
    elsif last_name.nil?
      @first_name = full_name[0]
      @last_name = full_name[1]
    elsif middle_name.nil?
      @first_name = name
      @last_name = last_name
    else
      @first_name = name
      @last_name = last_name
      @middle_name = middle_name
    end
  end
end

me = Person.new('Corey Votta')
require 'pry'
binding.pry