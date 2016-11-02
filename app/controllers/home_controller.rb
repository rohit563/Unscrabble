class HomeController < ApplicationController
  def index
  end
  
  
    def tokenize
        @letters = Array.new(4)
        puts (params[:letters])
        flash[:notice] = params[:letters]
        redirect_to :back, :notice => "Post has been saved successfully."

        # redirect_to :back
    end
end
