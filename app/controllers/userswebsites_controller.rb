class UserswebsitesController < ApplicationController
  def create
     @userwebsite = UsersWebsites.new(params[:id])
      if @userwebsite.save
      redirect_to mypage_path
      end
     #redirect_to page_path
  end
  
  def destroy
     redirect_to current_user
  end
end
