class AppController < ApplicationController
  skip_before_action :authenticate_user!#, except => [:index]
  def getAction
    respond_to do |format|
      format.json { render json: [current_user.email] }#render as color_code: FF002233
      end
  end
end
