class SecretsController < ApplicationController

    def index
        # @secrets = Secret.eager_load(:user).references(:user)
    end


end
