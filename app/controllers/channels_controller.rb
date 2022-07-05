class ChannelsController < ApplicationController
    def index
        channels = Channel.all
        render json: channels, except: [:created_at, :updated_at], include: [:channel_owners, :channel_members]
    end

    def show
        channel = Channel.find_by(id: params[:id])
        if channel
            render json: channel, include: [:channel_owners, :channel_members]
        else
            render json: { message: 'Item not found' }
        end
    end

    def create
        channel = Channel.new(channel_params)
        if channel.save
            channel_owner = ChannelOwner.new(user_id: current_user.id, channel_id: channel.id)
            channel_member = ChannelMember.new(user_id: current_user.id)
            if channel_owner.save
                if channel_member.save
                    render json: channel, include: [:channel_owners, :channel_members]
                else
                    #render :json => {:msg ""}
                    render json: { msg: "Channel Member failed to create" }, status: :bad_request
                end
            else
                render json: { msg: "Channel Owner failed to create" }, status: :bad_request
                render json: channel, include: [:channel_owners, :channel_members]
            end
        else
            render json: { msg: "Channel failed to be created" }, status: :bad_request
        end
    end

    def update
        channel = Channel.find(params[:id])
        channel.update_attributes(channel_params)
        channel.save
        render json: channel
    end

    def destroy
        Channel.destroy(params[:id])
        render json: {message: 'Item deleted'}
    end

    private

    def channel_params
        params.require(:channel).permit(:title)
    end

end
