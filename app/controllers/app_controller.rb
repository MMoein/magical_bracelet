class AppController < ApplicationController
  def getAction
    respond_to do |format|
      format.html
      format.json { render json: [current_user.email] }#render as color_code: FF002233
      end
  end
end
