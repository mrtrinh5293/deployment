class PlaylistsController < ApplicationController

	def index
		@playlists = Playlist.eager_load(:user).all
	end
	def create
		song = Song.find(params[:song][:id])
		playlist = Playlist.create(user: current_user, song: song)
		redirect_to songs_path
		end
		
	def show
		@user_that_created_playlist = Playlist.find(params[:id])
    @playlist_by_id = Playlist.find(params[:id])
    @adds_by_playlist_id = Playlist.find(params[:id]).playlists.all
	end
		
		private
        def new_playlist
        	params.require(:playlist).permit(:title, :user_id)
    		end
	
	end