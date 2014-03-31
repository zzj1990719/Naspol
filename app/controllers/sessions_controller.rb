class SessionsController < ApplicationController
  def new                            #跳转到登陆界面
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to mypage_path           #登陆后跳转到mypage界面
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'                      #登陆失败，重新加载登陆界面，和redirect_to不一样
    end
  end

  def destroy
    sign_out
    redirect_to root_path               #退出后跳转到首页
  end
end
