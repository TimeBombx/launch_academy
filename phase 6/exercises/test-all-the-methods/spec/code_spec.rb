require 'simplecov'
SimpleCov.start
require 'pry'
require_relative '../code'

# YOUR TEST CODE HERE
describe 'perimeter' do
  it 'returns 20 for a square with a width of 5' do
    expect(perimeter(5)).to eq(20)
  end

  it 'returns 30 for a rectangle with a width of 5 and a length of 10' do
    expect(perimeter(5, 10)).to eq(30)
  end
end

describe 'average' do
  it 'returns the average of the given grade list' do
    grade_list = [100, 70.5, 67, 80]
    expect(average(grade_list)).to eq(79.375)
  end
end

describe 'rankings' do
  it 'should display students with a number' do
    students = ["Corey Votta", "Jon Smith"]
    expect(rankings(students)).to eq("1. Corey Votta\n2. Jon Smith\n")
  end
end

describe 'greet' do
  name = 'Corey'

  it 'return spanish greeting' do
    expect(greet(name, 'spanish')).to eq('Hola Corey!')
  end

  it 'return italian greeting' do
    expect(greet(name, 'italian')).to eq('Ciao Corey!')
  end

  it 'return french greeting' do
    expect(greet(name, 'french')).to eq('Bonjour Corey!')
  end

  it 'return default greeting' do
    expect(greet(name)).to eq('Hi Corey!')
  end
end

describe 'create puzzle' do
  it 'creates a puzzle' do
    word = 'test word'
    result = '_ e _ _ _ w _ _ _'
    expect(create_puzzle(word, ['e', 'w'])).to eq(result)
  end
end

describe 'divisible by three' do
  it 'return true' do
    expect(divisible_by_three(3)).to eq(true)
  end

  it 'return false' do
    expect(divisible_by_three(2)).to eq(false)
  end
end

describe 'prefect square' do
  it 'throws argument error' do
    expect{ perfect_square?(-1) }.to raise_error(ArgumentError)
  end

  it 'return true' do
    expect(perfect_square?(4)).to eq(true)
  end

  it 'return true' do
    expect(perfect_square?(5)).to eq(false)
  end
end
