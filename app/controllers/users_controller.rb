class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    
    def profile
        render json: { user: UserSerializer.new(current_user), posts: current_user.posts }, status: :accepted
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
        @token = encode_token({ user_id: @user.id })
        render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
        render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end
 
    def update
        @user = User.find_by(id: params[:id])
        @user.update(name: user_params[:name],
            bio: user_params[:bio],
            image_url: user_params[:image_url])
        render json: {user: @user}, status: :accepted

    end

    def posts
        render json: { posts: current_user.posts }, status: :accepted
    end

    private
    def user_params
        params.require(:user).permit(:name, :username, :password, :bio, :image_url)
    end
end
