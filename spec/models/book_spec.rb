require 'spec_helper'

describe Book do

  before (:each) do
    @book = Factory.build(:book)
  end

  it 'should create new instance with valid attributes' do
     @book.should be_valid
  end
end
