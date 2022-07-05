class SessionsController < ApplicationController

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            payload = { user_id: @user.id }
            #JWT.encode takes 3 args, 1. the data u want to encode, 2: key u want to use. 3. algorithm you want to use
            token = JWT.encode(payload, 'SUPER_SECRET_KEY', 'HS256')
            # byebug
        else
            render :json => { :msg => "Login failed... Please make sure you have entered the correct username or password"}
        end
    end
end
