class OverviewController < ApplicationController

	def index
		$redis.sadd("user:#{current_user.id}:queries", params[:term])
		@tweets = []
		Twitter.search("#{params[:term] || "StackSocial"}", :count => 20, :result_type => "mixed").results.map do |tweet|
			@tweets << { :text => tweet.text, :from_user => tweet.from_user, :created_at => tweet.created_at, :profile_image_url => tweet.user.profile_image_url }
		end

		respond_to do |format|
    	format.html # index.html.erb
    	format.json  { render :json => @tweets }
  	end
	end

end
