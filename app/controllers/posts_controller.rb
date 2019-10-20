class PostsController < ApplicationController
    before_action :find_post, only: [:update, :destroy, :eeg]
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
        @post.update(post_params)
        # if @post.valid?
            render json: { post: @post }, status: :created
        # else
            # render json: { error: 'failed to create post' }, status: :not_acceptable
        # end
    end

    def destroy
        @post.destroy
        render json: {}
    end

    def eeg
        # byebug
        if @post.data_file_url.nil?
            render json: {data: {}}
        else
            render json: { data: @post.eeg }, status: :created
        end
    end

    private
    def find_post
        @post = Post.find_by(id: params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :description, :body, :user_id, :image_url, :data_file_url)
    end
end
