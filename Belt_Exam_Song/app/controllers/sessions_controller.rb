class SessionsController < ApplicationController

	def new
    end
	

  def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            #log in
            
            redirect_to '/songs'
        else
            #error
            flash[:errors] = ["Invalid email/password combination"] #using flash.now ?? => for display the flash in the render page
            redirect_to '/main'
        end
  end

  def destroy
    session.delete :user_id

    redirect_to new_session_path
end
end