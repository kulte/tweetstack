class WelcomeController < ApplicationController
	respond_to :json

	def index
		@hello = { :hello => "world" }
		respond_with @hello
	end

end
