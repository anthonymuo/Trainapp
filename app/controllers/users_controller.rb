class UsersController < ApplicationController
   
   before_action :logged_in_user, only: [:index ,:edit, :update, :destroy]
   before_action :correct_user,   only: [:edit, :update] 
   before_action :admin_user,     only: :destroy
   before_action :require_login, only: [:show,], raise: false
   
  def index
   @users = User.paginate(page: params[:page])
   #@user = User.find(params[:id])
   #@users = User.all
  end
  #show a user
  def show
    @user = User.find(params[:id])
  end

  def new
    @user=User.new
  end
 #creat a form  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to GESS Bed & Breakfast!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
# edit a user
  def edit
    @user = User.find(params[:id])
  end
 #upadat user  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
       flash[:success] = "Profile updated"
       redirect_to @user
    else
      render 'edit'
    end
  end
  #delete user
   def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
   end
  #using strong parameters
  private
    def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation)
    end
   
    
     # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        #store_location
        flash[:danger] = "Please log in."
        redirect_to root_url
      end
    end
    

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    

     # Confirms an admin user.
    def admin_user
          redirect_to(root_url) unless current_user.admin?
    end


     private

  def require_login
    unless logged_in?
      flash[:danger] = "You must be logged in to access this section"
      redirect_to login_path # halts request cycle
    end
  end

end


