class BoardControllerController < ApplicationController
    
    def board_params
        params.require(:board).permit(:l1, :l2, :l3, :l4, :l5, :l6, :l7, :l8, :l9, :l10, :l11, :l12, :l13, :l14, :l15, :l16)
    end
    
    def create
        flash[:notice] = "Successfully created!"
    end
    
end
