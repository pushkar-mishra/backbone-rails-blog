class UsersController < ApplicationController
  before_action :set_user, only: [:edit,:update,:show]
  before_action :require_same_user, only: [:edit, :update]
  
  def index
    #@users = User.paginate(page: params[:page], per_page: 4)
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Congratulations! Your account has been created successfuly."
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      render :new
    end
  end
  
  def edit
    
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "Your Profile has been updated successfuly."
      redirect_to posts_path
    else
      render :edit
    end
  end
  
  def show
    @posts = @user.posts.all
    #@posts = @user.posts.paginate(page: params[:page], per_page: 4)
  end
  
  private
    def user_params
      params.require(:user).permit(:name,:email,:password)
    end
    
    def require_same_user
      if current_user != @user
        flash[:danger] = "You can only edit your profile."
        redirect_to root_path
      end
    end
    
    def set_user
      @user = User.find(params[:id])
      flash[:success] = @user
    end

  
end