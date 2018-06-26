class SongsController < ApplicationController
	def index
        @song = Song.new
        @songs = Song.all
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) # User.find(session[:user_id]) #if session[:user_id] 
  end	

    def show
        @song = Song.find(params[:id])
    end

    def create
        @user = current_user
        @song = Song.create(artist: params[:song][:artist], title: params[:song][:title], user:current_user)
        if @song.save
            flash[:errors] = @song.errors.full_messages
        end
        redirect_to '/songs'
  end

  def delete_song
    delete = Song.find(params[:id]).destroy
    redirect_to songs_path
    end

end