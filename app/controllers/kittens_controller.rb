class KittensController < ApplicationController
    
    def new
        @kitten = Kitten.new
    end
    
    def create
        @kitten = Kitten.new(kitten_params)
        if @kitten.save
            flash[:success] = 'New kitten created'
            redirect_to @kitten
        else
            flash[:danger] = 'More info needed to create kitten'
            render 'new'
        end
    end
    
    def show
        @kitten = Kitten.find(params[:id])
    end
    
    def edit
        @kitten = Kitten.find(params[:id])
    end
    
    def update
        @kitten = Kitten.find(params[:id])
        if @kitten.update_attributes(kitten_params)
            flash[:success] = "Kitten updated"
            redirect_to @kitten
        else 
            flash[:danger] = "Kitten not updated"
            render 'edit'
        end
    end
    
    def index
        @kittens = Kitten.all
    end
    
    def destroy
        Kitten.find(params[:id]).destroy
        flash[:success] = "Kitten deleted :("
        redirect_to root_url
    end
    
    private
    
      def kitten_params
          params.require(:kitten).permit(:name, :age, :cuteness, :softness)
      end
    
end
