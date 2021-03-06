class ChannelOwnersController < ApplicationController

rescue_from ActiveRecord::RecordInvalid, with :invalid
rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def index
        channel_owners = ChannelOwner.all
        render json: channel_owners, except: [:created_at, :updated_at], include: [:user, :channel]
    end

    def show
        channel_owner = ChannelOwner.find_by(id: params[:id])
        if channel_owner
            render json: channel_owner.slice(:id, :channel_id, :user_id)
        else
            render json: { message: 'Item not found' }
        end
    end

    def create
        channel_owner = ChannelOwner.new(channel_owner_params)
        channel_owner.save
        render json: channel_owner
    end

    def updated
        channel_owner = ChannelOwner.find(params[:id])
        channel_owner.update_attributes(channel_owner_params)
        channel_owner.save
        render json: channel_owner
    end

    def destroy
        ChannelOwner.destroy(params[:id])
        render json: { message: 'Item deleted' }
    end

    private

    def channel_owner_params
        params.require(:channel_owner).permit(:channel_id, :user_id)
    end

    def invalid error
        render json: { errors: error.record.errors.full)messages }, status: 422
    end

    def not_found
        render json: { error: "User not found" }, status: 404
    end


end
