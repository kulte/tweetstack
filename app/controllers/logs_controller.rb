class LogsController < ApplicationController

	def index
		@queries = $redis.smembers("user:#{current_user.id}:queries")

		respond_to do |format|
    	format.html # index.html.erb
    	format.json  { render :json => @queries }
  	end
	end

end
