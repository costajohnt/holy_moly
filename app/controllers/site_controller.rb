class SiteController < ApplicationController

  def index
   if current_user
     redirect_to :profile
   end
  end

end
