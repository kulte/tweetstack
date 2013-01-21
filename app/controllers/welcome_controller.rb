class WelcomeController < ApplicationController
	respond_to :json

	def index
		if current_user then redirect_to overview_index_path end
	end

end
