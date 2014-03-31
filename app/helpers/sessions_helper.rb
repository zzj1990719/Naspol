module SessionsHelper
  
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.hash(remember_token))
    self.current_user = user
  end
  
  def signed_in?       #判断是否登陆
    !current_user.nil?
  end
  
  def current_user=(user)
    @current_user = user 
  end
  
  def current_user       #current_user代表当前用户
    remember_token = User.hash(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end
  
  def current_user?(user)
    user == current_user
  end
  
  def sign_out             #退出登陆
    current_user.update_attribute(:remember_token,
                                  User.hash(User.new_remember_token))
    self.current_user = nil
    cookies.delete(:remember_token)
  end
  
  def redirect_back_or(default)       #做某个操作后返回原来的界面
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location                  #在做某个操作之前，先存储当前页面，供上面那个方法调用
    session[:return_to] = request.fullpath if request.get?
  end
  
  def current_website=(website)
    @current_website = website 
  end
  
end
