

class HomeController < ApplicationController
    def index
    end
  
  def solvedGame
    @game =  Game.find_by_id(params[:game])
    
    @letters= {"0"=> @game.f1, "1"=> @game.f2, "2"=> @game.f3, "3"=>@game.f4, 
        "4" =>@game.f5, "5"=> @game.f6, "6"=> @game.f7, "7"=> @game.f8,"8"=> @game.f9,"9"=> @game.f8,"10"=> @game.f11,
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
              
    @answers = @apirequest.body
  end
  

def deleteGame
Game.destroy(params[:game])
redirect_to :back
end

    def tokenize 
       if letter 
           #store the input game in the db
           @new_game = Game.create!(f1: params[:letters][:"0"], f2: params[:letters][:"1"], f3: params[:letters][:"2"], f4: params[:letters][:"3"], f5: params[:letters][:"4"], f6: params[:letters][:"5"], f7: params[:letters][:"6"], f8: params[:letters][:"7"], f9: params[:letters][:"8"], f10: params[:letters][:"9"], f11: params[:letters][:"10"], f12: params[:letters][:"11"], f13: params[:letters][:"12"], f14: params[:letters][:"13"], f15: params[:letters][:"14"], f16: params[:letters][:"15"], user_id: current_user.id, gameName: params[:game])
        
        
            redirect_to home_saved_path
        #   @userID = find(params[:userID])
            # flash[:notice] = @new_game# "Post has been saved successfully."
       else
            flash[:notice] = "Error: please input a letter into every box"
            redirect_to :back
        
       end
       
       
       
       
       
       
    end
    

    
    def submit
      
    end
    
    
    def letter
        return (params[:letters][:"0"].match /[A-Za-z]/) && (params[:letters][:"1"].match /[A-Za-z]/) && (params[:letters][:"2"].match /[A-Za-z]/) && (params[:letters][:"3"].match /[A-Za-z]/) && (params[:letters][:"4"].match /[A-Za-z]/) && (params[:letters][:"5"].match /[A-Za-z]/) && (params[:letters][:"6"].match /[A-Za-z]/) && (params[:letters][:"7"].match /[A-Za-z]/) && (params[:letters][:"8"].match /[A-Za-z]/) && (params[:letters][:"9"].match /[A-Za-z]/) && (params[:letters][:"10"].match /[A-Za-z]/) && (params[:letters][:"11"].match /[A-Za-z]/) && (params[:letters][:"12"].match /[A-Za-z]/) && (params[:letters][:"13"].match /[A-Za-z]/) && (params[:letters][:"14"].match /[A-Za-z]/) && (params[:letters][:"15"].match /[A-Za-z]/)
    end
    # def letter?(lookAhead)
    #     lookAhead =~ /[[:alpha:]]/
    # end

    

end
