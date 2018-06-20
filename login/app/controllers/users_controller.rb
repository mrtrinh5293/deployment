class UsersController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]

    def new
    
    end


    def create
        if new_user.valid?
            session[:user_id] = new_user.id

        return redirect_to secrets_path 
    end


        redirect_to :back, alert: new_user.errors.full_messages
    end

    def show
    end


    private
        helper_method def user
            @user ||= User.find_by(id: params[:id])
        end


        helper_method def new_user
            @new_user ||= User.create(user_params) 
        end


        def user_params
            params.require(:user).permit(:fiest_name, :last_name, :email, :password, :password_confirmation)
        end


end
