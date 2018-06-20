class SessionsController < ApplicationController
    skip_before_action :require_login, except: [:destroy]

    def new
    end

    def create
        @user = User.find_by(email: params[:email])
        errors = []

        if @user
            if @user.authenticate(params[:password])
                session[:user_id] = @user.id

                return redirect_to secrets_path

            else
                errors << 'invalid password'
            end

        else
                errors << 'account invalid'
        end

        redirect_to :back, alert: errors
    end

    def destroy
        session.delete :user_id if session.key? 'user_id'
    
        redirect_to new_login_path
    end

end
