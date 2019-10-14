class PostsController < ApplicationController
    before_action :find_post, only: [:update, :delete]
    def index
        @posts = current_user.posts
        render json: { posts: @posts }
    end

        
    def create
        @post = Post.create(post_params)

        if @post.valid?
        # @token = encode_token({ user_id: @user.id })
        render json: { post: @post }, status: :created
        else
        render json: { error: 'failed to create post' }, status: :not_acceptable
        end
    end

    def update
        @post = Post.update(post_params)

        if @post.valid?
            @post.save
            render json: { post: @post }, status: :created
        else
            render json: { error: 'failed to create post' }, status: :not_acceptable
        end
    end


    def destroy
        @post.destroy
        render json: {}
    end

    private
    def find_post
        @post = Post.find_by(id: params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :description, :body, :user_id, :image_url)
    end
end
