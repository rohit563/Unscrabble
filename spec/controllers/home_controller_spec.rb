require 'spec_helper'
require 'rails_helper'

RSpec.describe HomeController, type: :controller do
    before do
        user = FactoryGirl.create(:user)
        allow(HomeController).to receive(:authenticate_user!).and_return(true)
        allow(HomeController).to receive(:current_user).and_return(user)
    end
    describe 'tokenize test' do
        it 'should take in fields from the board as params and check if it is not nil' do
            #  fake_results = [string('A'), string('B'), string('C'), string('D'), string('E'), string('F'), string('G'), string('H'),
            #  string('I'), string('J'), string('K'), string('L'), string('M'), string('N'), string('O'), string('P')]
            #  visit "/"
             post 'tokenize', letters: ["A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P"]
             flash[:notice].should == nil
        end
    end
    
    describe 'tokenize failure' do
        it 'should take in fields from the board as params and check if there is an error' do
            #  fake_results = [string('A'), string('B'), string('C'), string('D'), string('E'), string('F'), string('G'), string('H'),
            #  string('I'), string('J'), string('K'), string('L'), string('M'), string('N'), string('O'), string('P')]
            # visit "/"
            # first('input[type="submit"]').click
            post 'tokenize', letters: ["A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,"]
            flash[:notice].should == nil
        end
    end
end
