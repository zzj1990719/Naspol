class WebsitesController < ApplicationController
  $web_id = 0
  $web_d_id = 0
  def create
     @web = Website.new(website_params)       #把home里面的website实例变量传进来，用website_params捕捉参数
     web_id = @web.id
     @userwebsite = UsersWebsites.new(user_id: current_user.id, website_id: web_id )
     if UsersWebsites.find_by(user_id: current_user.id, website_id: web_id)
        #redirect_to page_path
     else
      if @userwebsite.save
        respond_to do |format|
        format.html  { redirect_to home_path }
        format.js
        end
      end
    end
     #redirect_to page_path
  end
  
  def destroy
     @web = Website.new(website_params)       #把home里面的website实例变量传进来，用website_params捕捉参数
     web_d_id = @web.id
     UsersWebsites.find_by(user_id: current_user.id, website_id: web_d_id).destroy
     respond_to do |format|
     format.html  { redirect_to home_path }
     format.js
     end
  end
 
 private
 
    def website_params            #捕捉website参数，可以自己定义捕捉那些参数
      params.require(:website).permit(:id, :web_type)
    end
end