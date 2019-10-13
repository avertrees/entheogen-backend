class PostsController < ApplicationController
    
    def index
        @posts = current_user.posts
        render json: {
            @posts
        }
        # if (current_user)
        # if (has_valid_token)
        # snacks = Snack.all
        # render json: snacks
        # else
        # render json: {
        #     go_away: true
        # }, status: :unauthorized
        # end
    end

    private
    def post_params
        params.require(:post).permit(:title, :description, :body, :user_id, :image_url)
    end
end
