class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :mypage]
  before_action :correct_user,   only: [:edit, :update, :mypage]
  #$website_id = 0
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])      #显示用户
    #@websites = User.find(current_user.id).websites     #多对多关联后，调用此用户的所有微博
    #@user_website = UsersWebsites.find_by_user_id(current_user.id)
    #website_id = @user_website.website_id
    #@website = Website.find(website_id)
    #@user_websites = UsersWebsites.all
    #@users = User.all
    #@user_website1 = @User.UsersWebsites.paginate(page: params[:page])
  end
  
  def mypage
    @user = User.find(current_user.id)    #显示当前用户的mypage
    @websites = User.find(current_user.id).websites     #多对多关联后，调用此用户的所有微博
    @pages = User.find(current_user.id).pages
    @reminds = User.find(current_user.id).reminds 
    @recommends = User.find(current_user.id).recommends 
    @userwebsite = UsersWebsites.new
  end
  
  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Naspol!"
      redirect_to @user
    else
      render 'new'           #创建失败，跳转到sign in界面
    end
  end
  
  def edit
    @user = User.find(params[:id])     
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  private

    def user_params            #调用user变量
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
    def signed_in_user          #判断是否登陆
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
   
    def correct_user           #判断用户是否正确
      @user = User.find(current_user.id)
      redirect_to(root_path) unless current_user?(@user)
    end
end
