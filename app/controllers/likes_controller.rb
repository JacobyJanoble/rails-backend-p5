class LikesController < ApplicationController

    def index
        likes = Like.all
        render json: likes, except: [:created_at, :updated_at], include: [:user, :post]
    end

    def show
        like = Like.find_by(id: params[:id])
        if like
            render json: { message: 'Item not found' }
        else
            render json: { message: 'Item not found' }
        end
    end

    def create
        authenticate!
        like = Like.new(like_params)
        like.user_id = current_user.id
        if like.save
            render json: like, include: [:user, :post]
        else
            #render:json =>
            render json: { msg: => "Failed to create like" }, status: :bad_request
        end
    end

    def undislike_like
        Dislike.destroy(params[:dislike_id])
        like = Like.new(like_params)
        if like.save
            render json: like, include: [:user, :post]
        else
            #render:json =>
            render json: { msg: "failed to create like" }, status: :bad_request
        end
    end

    def destroy
        authenticate!
        if Like.find(params[:id]).user_id == current_user.id
            Like.destroy(params[:id])
            render json: { message: 'Item deleted' }
        else
            #render:json =>
            render json: { msg: "Failed to delete like" }, status: :bad_request
        end
    end

    private

    def like_params
        params.require(:like).permit(:post_id, :user_id, :like_id, :dislike_id)
    end

end
