class PostsController < ApplicationController
    def index
        if (has_valid_token)
        snacks = Snack.all
        render json: snacks
        else
        render json: {
            go_away: true
        }, status: :unauthorized
        end
    end
end
