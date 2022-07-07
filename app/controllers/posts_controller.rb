class PostsController < ApplicationController

    def index
        posts = Post.all
        render json: posts, include: [:user, :postable, :likes, :dislikes, :posts]
    end

    def show
        post = Post.find_by(id: params[:id])
        if post
            render json: post, include: [:user, :postable, :likes, :dislikes, :posts]
        else
            render json: { message: 'Item not found' }
        end
    end

    def create
        authenticate!
        post = Post.new(post_params)
        post.user_id = current_user.id
        if post.save
            render json: post, include: [:user, :postable, :likes, :dislikes, :posts]
        else
            render json: { message: 'Post not found' }
        end
    end

    def update
        authenticate!
        post = Post.new(post_params)
        post.user_id = current_user.id
        if post.save
            render json: post, include: [:user, :postable, :likes, :dislikes, :posts]
        else
            #render:json =>
            render json: { msg: "Failed to create post" }, status: :bad_request
        end
    end

    def destroy
        Post.destroy(params[:id])
        render json: { message: 'Post deleted'}
    end

    private

    def post_params
        params.require(:post).permit(:content, :user_id, :postable_type, :postable_id, :title)
    end
end
