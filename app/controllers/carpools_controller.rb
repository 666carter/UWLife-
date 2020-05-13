class CarpoolsController < ApplicationController
    def show
        @carpool = Carpool.find(params[:id])
    end

    def index
        @carpools = Carpool.paginate(page: params[:page], per_page: 3)
    end

    def new
        @carpool = Carpool.new
    end

    def create
        @carpool = Carpool.new(params.require(:carpool).permit(:seats, :price, :locationFrom, :locationTo))
        if @carpool.save
            redirect_to @carpool
          else
            render 'new'
          end
    end

    def edit
        @carpool = Carpool.find(params[:id])
    end

    def update
        @carpool = Carpool.find(params[:id])
        if @carpool.update(params.require(:carpool).permit(:seats, :price, :locationFrom, :locationTo))
          redirect_to @carpool
        else
          render 'edit'
        end
      end
    
    def destroy
        @carpool = Carpool.find(params[:id])
        @carpool.destroy
        redirect_to carpools_path
    end
end