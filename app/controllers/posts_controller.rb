class PostsController < ApplicationController

    def index
        posts = Post.all
        render json: posts
    end

    def show
        post = Post.find_by(id: params[:id])
        if post
            render json: post
        else
            render json: { message: 'Item not found' }
        end
    end

    def create
        post = Post.create(post_params)
        render json: post
    end

    def update
        authenticate!
        post = Post.find(params[:id])
        if post.user_id == current_user.id
            post.update_attributes(post_params)
            post.save
            render json: post
        else
            render json: { message: 'The credentials you have presented are not authorized to edit this post, please be sure to be logged in appropriately.' }
        end
    end

    def destroy
        Post.destroy(params[:id])
        render json: { message: 'Post deleted'}
    end

    private

    def post_params
        params.permit(:id, :content, :user_id, :post_id, :postable_type, :postable_id, :title)
    end
end
