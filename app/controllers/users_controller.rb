class UsersController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :invalid
rescue_from ActiveRecord::RecordNotFound, with: :not_found


    def index
       users = User.all
       render json: users
    end

    def show
        user = User.find_by(id: params[:id])
        if user
            render json: user
        else
            render json: { message: 'Item not found' }
        end
    end

    def create
        user = User.create(user_params)
        payload = { user_id: user.id }
        token = JWT.encode(payload, 'SUPER_SECRET_KEY', HS256)
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
