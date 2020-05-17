class HousingsController < ApplicationController
    before_action :setup_housing, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy]
  
      def show
      end
  
      def index
          @housings = Housing.paginate(page: params[:page], per_page: 3)
      end
  
      def new
          @housing = Housing.new
      end
  
      def create
          @housing = Housing.new(params.require(:housing).permit(:howManyRooms, :price, :description, :time, :address, :requirement))
          @housing.user = current_user
          if @housing.save
              flash[:notice] = "Post was created successfully."
              redirect_to @housing
            else
              render 'new'
            end
      end
  
      def edit
      end
  
      def update
          if @housing.update(params.require(:housing).permit(:howManyRooms, :price, :description, :time, :address, :requirement))
            flash[:notice] = "Post was updated successfully."
            redirect_to @housing
          else
            render 'edit'
          end
        end
      
      def destroy
          @housing.destroy
          redirect_to housings_path
      end
  
      private
  
      def setup_housing
        @housing = Housing.find(params[:id])
      end
  
      def require_same_user
        if current_user != @housing.user && !current_user.admin?
          flash[:alert] = "You can only edit or delete your own post"
          redirect_to @housing
        end
      end
  
  end