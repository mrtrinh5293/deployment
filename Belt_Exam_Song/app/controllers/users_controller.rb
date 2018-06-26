class UsersController < ApplicationController


	before_action :require_correct_user, only: [:show]

	def index
		redirect_to '/main'
	end

	def show
		@user = User.find(session[:user_id])
		@user = current_user
	end

	def create
  		@user = User.new(user_params)
  		if @user.valid?
  			#sth
  			session[:user_id] = @user.id
  			redirect_to '/songs'
  		else
  			#error
  			flash[:errors] = @user.errors.full_messages
  			redirect_to '/main'
  		end
	end

	def new
		@user = User.new
	end

    def logout
        session.clear
        redirect_to "/"
    end


	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end
end