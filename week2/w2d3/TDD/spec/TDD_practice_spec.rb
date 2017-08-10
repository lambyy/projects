require 'rspec'
require 'TDD_practice'

describe '#my_uniq' do
  subject(:my_array) { [1, 2, 3, 3, 2, 3] }

  it 'removes duplicates from an array' do
    expect(my_array.my_uniq).to eq([1, 2, 3])
  end
  it 'returns unique elements in order they first appeared' do
    expect([4, 2, 2, 3].my_uniq).to eq([4, 2, 3])
  end
  it 'returns an array' do
    expect(my_array.my_uniq).to be_a(Array)
  end
end

describe '#two_sum' do
  it 'returns an empty array if there are no pairs that sum to zero' do
    expect([1,2,3,4].two_sum).to eq([])
  end
  it 'returns a pair of indices' do
    expect([1,2,3,-1].two_sum).to eq([[0,3]])
  end
  it 'returns pairs of indices sorted by index' do
    expect([-5,5,5].two_sum).to eq([[0,1], [0,2]])
  end
  it 'returns multiple pairs' do
    expect([-1,5,1,-5].two_sum).to eq([[0,2], [1,3]])
  end
  it 'does not return a false positive' do
    expect([0,3,4,-3].two_sum).to eq([[1,3]])
  end
  it 'does return pairs of two zeros' do
    expect([0,4,0,-3].two_sum).to eq([[0,2]])
  end
end

describe '#my_tranpose' do
  it 'the rows and columns are transposed' do
    array = [[0, 1, 2],
             [3, 4, 5],
             [6, 7, 8]]
    expect(array.my_tranpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
  end
end

describe '#stock_picker' do
  it 'returns the first instance if there is a tie' do
    expect([1, 1, 1, 1, 5, 1, 1].stock_picker).to eq([0, 4])
  end
  it 'returns the pair for a simple case' do
    expect([1, 2, 3, 4, 5, 6, 7].stock_picker).to eq([0, 6])
  end
  it 'does not sell before it buys' do
    expect([4, 3, 4, 5, 4, 2, 4].stock_picker).to eq([1,3])
  end
end
