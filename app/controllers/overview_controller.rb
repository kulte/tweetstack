class OverviewController < ApplicationController
	respond_to :json

	def index
		@tweets = []
		Twitter.search("#{params[:term] || "StackSocial"}", :count => 20, :result_type => "mixed").results.map do |tweet|
			@tweets << { :text => tweet.text, :from_user => tweet.from_user, :created_at => tweet.created_at }
		end
		respond_with @tweets
	end
end
