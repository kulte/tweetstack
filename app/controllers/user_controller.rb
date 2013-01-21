class UserController < ApplicationController
	respond_to :json

	def show
		@tweets = []
		Twitter.user_timeline("#{params[:user]}").map do |tweet|
			@tweets << { :text => tweet.text, :from_user => tweet.from_user, :created_at => tweet.created_at }
		end
		respond_with @tweets
	end
end
