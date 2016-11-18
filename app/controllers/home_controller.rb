class HomeController < ApplicationController
    def index
    end
  
  
    def tokenize
     #   puts (params[:letters])
     # flash[:notice] = params[:letters]
     #  @letters = params[:letters] 
   if !params[:letters][:"0"].empty? && !params[:letters][:"1"].empty? && !params[:letters][:"2"].empty? && !params[:letters][:"3"].empty? && !params[:letters][:"4"].empty? && !params[:letters][:"5"].empty? && !params[:letters][:"6"].empty? && !params[:letters][:"7"].empty? && !params[:letters][:"8"].empty? && !params[:letters][:"9"].empty? && !params[:letters][:"10"].empty? && !params[:letters][:"11"].empty? && !params[:letters][:"12"].empty? && !params[:letters][:"13"].empty? && !params[:letters][:"14"].empty? && !params[:letters][:"15"].empty?
       @new_game = Game.create!(f1: params[:letters][:"0"], f2: params[:letters][:"1"], f3: params[:letters][:"2"], f4: params[:letters][:"3"], f5: params[:letters][:"4"], f6: params[:letters][:"5"], f7: params[:letters][:"6"], f8: params[:letters][:"7"], f9: params[:letters][:"8"], f10: params[:letters][:"9"], f11: params[:letters][:"10"], f12: params[:letters][:"11"], f13: params[:letters][:"12"], f14: params[:letters][:"13"], f15: params[:letters][:"14"], f16: params[:letters][:"15"])
        # flash[:notice] = @new_game# "Post has been saved successfully."
        
   else
        flash[:notice] = "Error: please input a letter into every box"
       end
       redirect_to "http://unscrabbling-rohit-banda.c9users.io:8080/"
        # redirect_to :back
    end
    
    def solve
         
    end
    
    def submit
      
    end
end
