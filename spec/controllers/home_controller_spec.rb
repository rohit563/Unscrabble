require 'spec_helper'
require 'rails_helper'

RSpec.describe HomeController, type: :controller do
    before do
        user = FactoryGirl.create(:user)
    sign_in user
        allow(HomeController).to receive(:authenticate_user!).and_return(true)
        allow(HomeController).to receive(:current_user).and_return(user)
         request.env['HTTP_REFERER'] =  home_index_url
    end
    # describe 'tokenize test' do
    #     it 'should take in fields from the board as params and check if it is not nil' do
    #          post 'tokenize', letters: ["A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P"]
    #          response.should redirect_to home_solvedGame_path
    #     end
    # end
    
    describe 'tokenize failure' do
        it 'should take in fields from the board as params and check if there is an error' do
            @game = Game.create!(f1: "p", f2: "i", f3: "n", f4: "o", f5: "p", f6: "i", f7: "n", f8: "o", f9: "a", f10: "b", f11: "c", f12: "d", f13: "e", f14: "f", f15: "g", f16: "h", user_id: 0, gameName: "game")
              @letters= {"0"=> @game.f1, "1"=> @game.f2, "2"=> @game.f3, "3"=>@game.f4, 
        "4" =>@game.f5, "5"=> @game.f6, "6"=> @game.f7, "7"=> @game.f8,"8"=> @game.f9,"9"=> @game.f10,"10"=> @game.f11,
        "11"=> @game.f12,"12"=> @game.f13,"13"=> @game.f14,"14"=> @game.f15,"15"=> @game.f16}
    
            post 'tokenize', letters: @letters
              response.should_not redirect_to home_solvedGame_path
        end
    end
    
    
    
     describe 'delete game' do
        it 'delete a game with given game.id' do
            @game=  Game.create!(f1: "a", f2: "a", f3: "a", f4: "a", f5: "a", f6: "a", f7: "a", f8: "a", f9: "a", f10: "a", f11: "a", f12: "a", f13: "a", f14: "a", f15: "a", f16: "a", user_id: 0, gameName: "game")
          
            expect{
              get :deleteGame,game: @game.id      
            }.to change(Game,:count).by(-1)
          
      
        end
            it ' should not delete a game with given game.id' do
            @game1=  Game.create!(f1: "a", f2: "a", f3: "a", f4: "a", f5: "a", f6: "a", f7: "a", f8: "a", f9: "a", f10: "a", f11: "a", f12: "a", f13: "a", f14: "a", f15: "a", f16: "a", user_id: 0, gameName: "game")
            @game2=  Game.create!(f1: "a", f2: "a", f3: "a", f4: "a", f5: "a", f6: "a", f7: "a", f8: "a", f9: "a", f10: "a", f11: "a", f12: "a", f13: "a", f14: "a", f15: "a", f16: "a", user_id: 0, gameName: "game")
            
            @id = @game1.id
            post 'deleteGame', game: @id
            Game.find_by_id(@id).nil? && @game2
        end
    end
    
    
    
    
    
    
    
    
    
    
    
      
        
    
    describe 'solve a game' do
        it 'should solve a game(generate all legal boggle moves) with a given string'do
             gameOne=  Game.create!(f1: "p", f2: "i", f3: "n", f4: "o", f5: "p", f6: "i", f7: "n", f8: "o", f9: "a", f10: "b", f11: "c", f12: "d", f13: "e", f14: "f", f15: "g", f16: "h", user_id: 0, gameName: "game")
           game1 = Game.create!(f1: "a", f2: "a", f3: "a", f4: "a", f5: "a", f6: "a", f7: "a", f8: "a", f9: "a", f10: "a", f11: "a", f12: "a", f13: "a", f14: "a", f15: "a", f16: "a", user_id: 0, gameName: "game")
        
        get :solvedGame, game: gameOne.id 
   
        end
         it 'should not solve ig a game(generate all legal boggle moves) is not with a given string'do
             @gamethatwillFail=  Game.create!(f1: "p", f2: "i", f3: "n", f4: "o", f5: "p", f6: "i", f7: "n", f8: "o", f9: "a", f10: "b", f11: "c", f12: "d", f13: "e", f14: "f", f15: "g", f16: "h", user_id: 0, gameName: "game")
            
                    end
        
    end

    
    
    
end
