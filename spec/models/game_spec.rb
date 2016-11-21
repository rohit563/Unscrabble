require 'spec_helper'
require 'rails_helper'

RSpec.describe Game, :type => :model do
  it "is invalid with invalid attributes" do
    expect(Game.new).to_not be_valid
  end
  
  it "is valid with valid attributes" do

game =Game.new(f1: "A", f2: "B", f3: "A", f4: "B", f5: "A", f6: "B", f7: "A", f8: "B", f9: "A", f10: "B", f11: "A", f12: "B", f13: "A", f14: "B", f15: "A", f16: "B")
    expect(game).to be_valid
  end
  
  it "is not valid with not all attributes present"do
  game =Game.new( f2: "B", f3: "A", f4: "B", f5: "A", f6: "B", f7: "A", f8: "B", f9: "A", f10: "B", f11: "A", f12: "B", f13: "A", f14: "B", f15: "A", f16: "B")

  expect(game).to_not be_valid
  end
  
  it "is not valid with attributes length not equal to one"do
       game =Game.new(f1: "GG", f2: "4", f3: "2", f4: "0", f5: "BLA", f6: "ZEIT", f7: "A", f8: "B", f9: "A", f10: "B", f11: "A", f12: "B", f13: "A", f14: "B", f15: "A", f16: "B")
  expect(game).to_not be_valid
  end
  
   it "is not valid with attributes length not equal to one"do
       game =Game.new(f1: "GG", f2: "4", f3: "2", f4: "0", f5: "BLA", f6: "ZEIT", f7: "A", f8: "B", f9: "A", f10: "B", f11: "A", f12: "B", f13: "A", f14: "B", f15: "A", f16: "B")
  expect(game).to_not be_valid
  end
end