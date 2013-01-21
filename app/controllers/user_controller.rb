class UserController < ApplicationController
	
	def show
		@tweets = []
		Twitter.user_timeline("#{params[:id]}").map do |tweet|
			@tweets << { :text => tweet.text, :from_user => tweet.from_user, :created_at => tweet.created_at, :profile_image_url => tweet.user.profile_image_url }
		end

		respond_to do |format|
    	format.html # index.html.erb
    	format.json  { render :json => @tweets }
  	end
	end
end
