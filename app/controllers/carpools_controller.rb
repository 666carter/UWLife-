class CarpoolsController < ApplicationController
  before_action :setup_carpool, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

    def show
    end

    def index
        @carpools = Carpool.paginate(page: params[:page], per_page: 3)
    end

    def new
        @carpool = Carpool.new
    end

    def create
        @carpool = Carpool.new(params.require(:carpool).permit(:seats, :price, :locationFrom, :locationTo, :description, :time))
        @carpool.user = current_user
        if @carpool.save
            flash[:notice] = "Post was created successfully."
            redirect_to @carpool
          else
            render 'new'
          end
    end

    def edit
    end

    def update
        if @carpool.update(params.require(:carpool).permit(:seats, :price, :locationFrom, :locationTo, :description, :time))
          flash[:notice] = "Post was updated successfully."
          redirect_to @carpool
        else
          render 'edit'
        end
      end
    
    def destroy
        @carpool.destroy
        redirect_to carpools_path
    end

    private

    def setup_carpool
      @carpool = Carpool.find(params[:id])
    end

    def require_same_user
      if current_user != @carpool.user && !current_user.admin?
        flash[:alert] = "You can only edit or delete your own post"
        redirect_to @carpool
      end
    end

end