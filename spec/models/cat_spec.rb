require 'rails_helper'

RSpec.describe Cat, type: :model do
  it "should validate name" do
    cat = Cat.create(age: 1, enjoys: 'Climbing trees', image: 'https://hips.hearstapps.com/hmg-prod/images/cute-cat-photos-1593441022.jpg?crop=0.670xw:1.00xh;0.167xw,0&resize=640:*')
    expect(cat.errors[:name]).to_not be_empty
  end

  it "should validate age" do
    cat = Cat.create(name: 'Bob', enjoys: 'Climbing trees', image: 'https://hips.hearstapps.com/hmg-prod/images/cute-cat-photos-1593441022.jpg?crop=0.670xw:1.00xh;0.167xw,0&resize=640:*')
    expect(cat.errors[:age]).to_not be_empty
  end

  it "should validate the cat enjoys a hobby and the minimum length is 10" do
    cat = Cat.create(name: 'Bob', age: 1, image: 'https://hips.hearstapps.com/hmg-prod/images/cute-cat-photos-1593441022.jpg?crop=0.670xw:1.00xh;0.167xw,0&resize=640:*')
    expect(cat.errors[:enjoys]).to_not be_empty
  end

  it "should validate the cat has an image" do
    cat = Cat.create(name: 'Bob', age: 1, enjoys: 'Climbing trees')
    expect(cat.errors[:image]).to_not be_empty
  end
end
