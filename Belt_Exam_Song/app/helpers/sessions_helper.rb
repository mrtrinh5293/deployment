module SessionsHelper

	def log_in(user)
		session[:user_id] = user.id
	end

	def current_user
	  	@current_user ||= User.find_by(id: session[:user_id]) # User.find(session[:user_id]) #if session[:user_id] 
	end	

	def require_login
	    redirect_to '/main' if session[:user_id] == nil
	end	

	def require_correct_user
	    user = User.find(params[:id])
	    if not user
	    	redirect_to "/users/#{current_user.id}"
	    end
	end
end