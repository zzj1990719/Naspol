class NaspolindexController < ApplicationController
  before_action :signed_in_user
  def home
    @user = User.find(current_user.id)
    #@userwebsite = current_user.UsersWebsites.build if signed_in?
    #@user = User.new
    @web = Website.new
    @userwebsit = UsersWebsites.new
    @websites = Website.all
    @reminduser = RemindsUsers.new
    #@websites = @User.users_websites
    #@website = Website.find(current_user.id)    #这个地方调用模型的时候第一个字母要大写
  end

  def about
  end

  def page
    @pages =Page.all
  end
  
  private
  
   def signed_in_user          #判断是否登陆
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
end
