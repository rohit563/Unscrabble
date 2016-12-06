

class HomeController < ApplicationController
    def index
    end
  
  def solve

#     require'unirest'#used for http request to api
#     @apirequest=Unirest.get "https://codebox-boggle-v1.p.mashape.com/ABCDEFGHIJKLMNOP",
#         headers:{
#     "X-Mashape-Key" => "dD07jz0voGmshZW6IXL7Ig9Jp883p1OzRPbjsnqogyFRjeOqfX",
#     "Accept" => "text/plain"
#       }
#       p = params
# p[:response] =@apirequest
# @ap=Rails.logger.debug("My object: #{@apirequest.body.inspect}")


  end
  
    def tokenize 
       if !params[:letters][:"0"].empty? && !params[:letters][:"1"].empty? && !params[:letters][:"2"].empty? && !params[:letters][:"3"].empty? && !params[:letters][:"4"].empty? && !params[:letters][:"5"].empty? && !params[:letters][:"6"].empty? && !params[:letters][:"7"].empty? && !params[:letters][:"8"].empty? && !params[:letters][:"9"].empty? && !params[:letters][:"10"].empty? && !params[:letters][:"11"].empty? && !params[:letters][:"12"].empty? && !params[:letters][:"13"].empty? && !params[:letters][:"14"].empty? && !params[:letters][:"15"].empty?
           @new_game = Game.create!(f1: params[:letters][:"0"], f2: params[:letters][:"1"], f3: params[:letters][:"2"], f4: params[:letters][:"3"], f5: params[:letters][:"4"], f6: params[:letters][:"5"], f7: params[:letters][:"6"], f8: params[:letters][:"7"], f9: params[:letters][:"8"], f10: params[:letters][:"9"], f11: params[:letters][:"10"], f12: params[:letters][:"11"], f13: params[:letters][:"12"], f14: params[:letters][:"13"], f15: params[:letters][:"14"], f16: params[:letters][:"15"])
            # flash[:notice] = @new_game# "Post has been saved successfully."
       else
            flash[:notice] = "Error: please input a letter into every box"
       end
       
       
       
       
       
       
       #solve the boggle as you store the model object
           require'unirest'#used for http request to api
    @apirequest=Unirest.get "https://codebox-boggle-v1.p.mashape.com/"+params[:letters].values.join.to_s,
        headers:{
    "X-Mashape-Key" => "dD07jz0voGmshZW6IXL7Ig9Jp883p1OzRPbjsnqogyFRjeOqfX",
    "Accept" => "text/plain"
      }
p = params
p[:response] =@apirequest.body
teststring = p[:response].join(" ").to_s
session[:apiResponse] ="input words = "+ params[:letters].values.join.to_s+ " possible words: " + teststring 
redirect_to :back
    end
    

    
    def submit
      
    end
end
