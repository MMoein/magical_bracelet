class HomeController < ApplicationController
  # skip_before_filter :authenticate_user!
  # prepend_before_filter :require_no_authentication
  # skip_before_filter :require_no_authentication
  # before_action :require_no_authentication, only: :index

	def index
    @sherv = "Hello World!"
	end
end
