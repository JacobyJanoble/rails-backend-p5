class UsersController < ApplicationController

    before_action :authorize_user, except: [:index, :create]

    def index
       users = User.all
       render json: users, except: [:created_at, :updated_at], include: [:likes, :dislikes, :channel_members, :channel_owners]
    end

    def show
        user = User.find_by(id: params[:id])
        if user
            render json: user, except: [:created_at, :updated_at], include: [:likes, :dislikes, :channel_members, :channel_owners]
        else
            render json: { message: 'Item not found' }
        end
    end

    # def create
    #     @user = User.create!(user_params)
    #     sessions[:user_id] = @user.id
    #     render json: user, status: :created
    # end

    def create
        @user = User.create(user_params)
        payload = { user_id: @user.id }
        token = JWT.encode(payload, ENV['SUPER_SECRET_KEY'], 'HS256')
        render json: { auth_key: token }, status: :ok
    end

    def update
        user = User.find(params[:id])
        user.update_attributes(user_params)
        user.save
        render json: user
    end

    def destroy
        User.destroy(params[:id])
        render json: { message: 'Item deleted' }
    end

    private

    def user_params
        params.permit(:email, :username, :password)
    end

end
