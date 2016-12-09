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
             post 'tokenize', letters: ["A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P"]
             flash[:notice].should == nil
        end
    end
    
    describe 'tokenize failure' do
        it 'should take in fields from the board as params and check if there is an error' do
 
            post 'tokenize', letters: ["A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,"]
            flash[:notice].should == nil
        end
    end
    
     describe 'delete game' do
        it 'delete a game with given game.id' do
            @game=  Game.create!(f1: "a", f2: "a", f3: "a", f4: "a", f5: "a", f6: "a", f7: "a", f8: "a", f9: "a", f10: "a", f11: "a", f12: "a", f13: "a", f14: "a", f15: "a", f16: "a", user_id: 0, gameName: "game")
            @id = @game.id
            post 'deleteGame', game: @id
            Game.find_by_id(@id).nil?
        end
            it ' should not delete a game without given game.id' do
            @game1=  Game.create!(f1: "a", f2: "a", f3: "a", f4: "a", f5: "a", f6: "a", f7: "a", f8: "a", f9: "a", f10: "a", f11: "a", f12: "a", f13: "a", f14: "a", f15: "a", f16: "a", user_id: 0, gameName: "game")
            @game2=  Game.create!(f1: "a", f2: "a", f3: "a", f4: "a", f5: "a", f6: "a", f7: "a", f8: "a", f9: "a", f10: "a", f11: "a", f12: "a", f13: "a", f14: "a", f15: "a", f16: "a", user_id: 0, gameName: "game")
            
            @id = @game1.id
            post 'deleteGame', game: @id
            Game.find_by_id(@id).nil? && @game2
        end
    end
    
    describe 'solve a game' do
        it 'should solve a game(generate all legal boggle moves) with a given string'do
             @game=  Game.create!(f1: "p", f2: "i", f3: "n", f4: "o", f5: "p", f6: "i", f7: "n", f8: "o", f9: "a", f10: "b", f11: "c", f12: "d", f13: "e", f14: "f", f15: "g", f16: "h", user_id: 0, gameName: "game")
           @game1 = Game.create!(f1: "a", f2: "a", f3: "a", f4: "a", f5: "a", f6: "a", f7: "a", f8: "a", f9: "a", f10: "a", f11: "a", f12: "a", f13: "a", f14: "a", f15: "a", f16: "a", user_id: 0, gameName: "game")
          
           @letters= {"0"=> @game.f1, "1"=> @game.f2, "2"=> @game.f3, "3"=>@game.f4, 
        "4" =>@game.f5, "5"=> @game.f6, "6"=> @game.f7, "7"=> @game.f8,"8"=> @game.f9,"9"=> @game.f10,"10"=> @game.f11,
        "11"=> @game.f12,"12"=> @game.f13,"13"=> @game.f14,"14"=> @game.f15,"15"=> @game.f16
    }
    
    
    @letter ="wow"
    @words = @game.f1+@game.f2+@game.f3+@game.f4+@game.f5+@game.f6+@game.f7+@game.f8+@game.f9+@game.f10+@game.f11+@game.f12+@game.f13+@game.f14+@game.f15+@game.f16
    
    
       require'unirest'#used for http request to api
            @apirequest=Unirest.get "https://codebox-boggle-v1.p.mashape.com/"+@letters.values.join.to_s,
                headers:{
            "X-Mashape-Key" => "dD07jz0voGmshZW6IXL7Ig9Jp883p1OzRPbjsnqogyFRjeOqfX",
            "Accept" => "text/plain"
              }
              
              @apirequest.body 
              
          end
          it 'should not solve ig a game(generate all legal boggle moves) is not with a given string'do
                @game = Game.create!(f1: "a", f2: "a", f3: "a", f4: "a", f5: "a", f6: "a", f7: "a", f8: "a", f9: "a", f10: "a", f11: "a", f12: "a", f13: "a", f14: "a", f15: "a", f16: "a", user_id: 0, gameName: "game")
          
           @letters= {"0"=> @game.f1, "1"=> @game.f2, "2"=> @game.f3, "3"=>@game.f4, 
        "4" =>@game.f5, "5"=> @game.f6, "6"=> @game.f7, "7"=> @game.f8,"8"=> @game.f9,"9"=> @game.f10,"10"=> @game.f11,
        "11"=> @game.f12,"12"=> @game.f13,"13"=> @game.f14,"14"=> @game.f15,"15"=> @game.f16
    }
    
    
    @words = @game.f1+@game.f2+@game.f3+@game.f4+@game.f5+@game.f6+@game.f7+@game.f8+@game.f9+@game.f10+@game.f11+@game.f12+@game.f13+@game.f14+@game.f15+@game.f16
    
    
       require'unirest'#used for http request to api
            @apirequest=Unirest.get "https://codebox-boggle-v1.p.mashape.com/"+@letters.values.join.to_s,
                headers:{
            "X-Mashape-Key" => "dD07jz0voGmshZW6IXL7Ig9Jp883p1OzRPbjsnqogyFRjeOqfX",
            "Accept" => "text/plain"
              }
              
              @apirequest.body
        end
         it 'should not solve ig a game(generate all legal boggle moves) is not with a given string'do
             @gamethatwillFail=  Game.create!(f1: "p", f2: "i", f3: "n", f4: "o", f5: "p", f6: "i", f7: "n", f8: "o", f9: "a", f10: "b", f11: "c", f12: "d", f13: "e", f14: "f", f15: "g", f16: "h", user_id: 0, gameName: "game")
            
                    end
        
    end

    
    describe 'parsing results answers' do
        it 'should take in fields from the board as params and check if there is an error' do
 
     @game=  Game.create!(f1: "p", f2: "i", f3: "n", f4: "o", f5: "p", f6: "i", f7: "n", f8: "o", f9: "a", f10: "b", f11: "c", f12: "d", f13: "e", f14: "f", f15: "g", f16: "h", user_id: 0, gameName: "game")
           @game1 = Game.create!(f1: "a", f2: "a", f3: "a", f4: "a", f5: "a", f6: "a", f7: "a", f8: "a", f9: "a", f10: "a", f11: "a", f12: "a", f13: "a", f14: "a", f15: "a", f16: "a", user_id: 0, gameName: "game")
          
           @letters= {"0"=> @game.f1, "1"=> @game.f2, "2"=> @game.f3, "3"=>@game.f4, 
        "4" =>@game.f5, "5"=> @game.f6, "6"=> @game.f7, "7"=> @game.f8,"8"=> @game.f9,"9"=> @game.f10,"10"=> @game.f11,
        "11"=> @game.f12,"12"=> @game.f13,"13"=> @game.f14,"14"=> @game.f15,"15"=> @game.f16
    }
    
    
    @letter ="wow"
    @words = @game.f1+@game.f2+@game.f3+@game.f4+@game.f5+@game.f6+@game.f7+@game.f8+@game.f9+@game.f10+@game.f11+@game.f12+@game.f13+@game.f14+@game.f15+@game.f16
    
    
       require'unirest'#used for http request to api
            @apirequest=Unirest.get "https://codebox-boggle-v1.p.mashape.com/"+@letters.values.join.to_s,
                headers:{
            "X-Mashape-Key" => "dD07jz0voGmshZW6IXL7Ig9Jp883p1OzRPbjsnqogyFRjeOqfX",
            "Accept" => "text/plain"
              }
              
    @answers        = @apirequest.body 
    @answersLong    = []
    @answersSix     = []
    @answersFive    = []
    @answersFour    = []
    @answersThree   = []
    
    @answers.each do |words| 
        if(words.length > 6)
            @answersLong.push(words)
        end
        if(words.length == 6)
            @answersSix.push(words)
        end
        if(words.length == 5)
            @answersFive.push(words) 
        end
        if(words.length == 4)
            @answersFour.push(words)
        end
        if(words.length == 3)
            @answersThree.push(words)
        end
    end 
    
    @answers == (@answersLong.length + @answersSix.length + @answersFive.length + @answersFour.length + @answersThree.length)
        end
    end
    
    
end
