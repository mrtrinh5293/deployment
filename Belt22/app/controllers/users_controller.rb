class UsersController < ApplicationController
    def index
    end
  
    def register
      user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to "/ideas/index"
        else
        flash[:errors] = @user.errors.full_messages
        redirect_to "/"
      end
    end
  
    def login
      user = User.find_by_email(params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to "/ideas/index"
      else
        redirect_to "/"
      end
    end
  
    def logout
        session.clear
        redirect_to "/"
    end
  
    def show
        @user = User.find(params[:id])
        @number_of_posts_by_user = @user.ideas.count
        @number_of_likes_by_user = @user.likes.count
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
    end
  
  end
  