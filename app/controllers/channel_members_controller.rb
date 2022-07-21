class ChannelMembersController < ApplicationController

rescue_from ActiveRecord::RecordInvalid, with: :invalid

    def index
        channel_members = ChannelMember.all
        render json: channel_members
    end

    def show
        channel_member = ChannelMember.find_by(id: params[:id])
        if channel_member
            render json: channel_member.slice(:id, :channel_id, :user_id)
        else
            render json: { message: 'Member not found' }
        end
    end

    def create
        ChannelMember.create(channel_member_params)
        render json: channel_members
    end

    def update
        channel_member = ChannelMember.find(params[:id])
        channel_member.update_attributes(channel_member_params)
        channel_members.save
        render json: channel_member
    end

    def destroy
        ChannelMember.destroy(params[:id])
    end

    private

    def channel_member_params
        params.permit(:channel_id, :user_id)
    end

    def invalid error
        render json: { errors: error.record.errors.full_messages }, status: 422
    end

    def not_found
        render json: {error: "Post not found"}, status: 404
    end


end
