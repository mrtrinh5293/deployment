class IdeasController < ApplicationController

    #


    def index
        @user = User.find(session[:user_id])
        @ideas = Idea.all
    end
  
    def add_idea
        idea = Idea.create(user_id: params[:user_id], message: params[:message])
        redirect_to "/ideas/index/"
    end
  
    def like_idea
        if Like.find_by(user_id: params[:user_id], idea_id: params[:id]) != nil
        redirect_to "/ideas/index"
        else
            like = Like.create(user_id: params[:user_id], idea_id: params[:id])
            redirect_to "/ideas/index"
      end

      def unlike_idea
        @like = Like.find_by(user_id: params[:user_id])
          @like.destroy
          redirect_to "/ideas/index"
        end
    end
  
    def delete_idea
        delete = Idea.find(params[:id]).destroy
        redirect_to "/ideas/index/"
    end
  
    def show
        @user_that_created_post = Idea.find(params[:id])
        @idea_by_id = Idea.find(params[:id])
        @likes_by_idea_id = Idea.find(params[:id]).likes.all
    end
  end
  