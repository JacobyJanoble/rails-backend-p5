class DislikesController < ApplicationController
    def index
        dislikes = Dislike.all
        render json: dislikes
    end

    def show
        dislike = Dislike.find_by(id: params[:id])
        if dislike
            render json: dislike
        else
            render json: { message: 'Item not found' }
        end
    end

    def create

        dislike = Dislike.create(dislike_params)
        render json: dislike
    end

    def unlike_dislike
        Like.destroy(params[:like_id])
        dislike = Dislike.create(dislike_params)
        render json: dislike
    end

    def destroy
        authenticate!
        if Dislike.find(params[:id]).user_id == current_user.id
            Dislike.destroy(params[:id])
            render json: {message: 'Item deleted'}
        else
            # render:json =>
            render json: { message: 'Failed to delete dislike' }, status: :bad_request
        end

        private

        def dislike_params
            params.permit(:post_id, :user_id)
        end
    end


end
