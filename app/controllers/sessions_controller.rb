class SessionsController < ApplicationController


    before_action :authorize_user, except: :create

    # def create
    #     user = User.find_by(username: params[:username])
    #     if user &.authenticate(params[:password])
    #         session[:user_id] = user.id
    #         render json: user, status: :created
    #     else
    #         render json: { error: "Invalid username or password" }, status: :unauthorized
    #     end
    # end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            payload = { user_id: @user.id}

            token = JWT.encode(payload, 'SUPER_SECRET_KEY', 'HS256')
            render json: { auth_key: token, user_id: @user.email }
        else
            render json: { msg: "Invalid username or password" }
        end
    end

    def destroy
        session.delete :user_id
        head :no_content
    end

end
