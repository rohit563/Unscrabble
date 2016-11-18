class BoardControllerController < ApplicationController
    
    def board_params
        params.require(:board).permit(:l1, :l2, :l3, :l4, :l5, :l6, :l7, :l8, :l9, :l10, :l11, :l12, :l13, :l14, :l15, :l16)
    end
    
    def create
        flash[:notice] = "Successfully created!"
    end
    
    def tokenize
        @letters = Array.new(4)
        puts (params[:letters])
        flash[:notice] = params[:letters]
        # add devise current_user.id add to params http://stackoverflow.com/questions/24101166/ruby-on-rails-and-devise-associating-id-from-one-table-to-a-foreign-key-id-in-an
        # redirect_to :back(request.parameters), :notice => "Post has been saved successfully."

        # redirect_to :back
    end
    
    def solve
        
        
    end
    
end
