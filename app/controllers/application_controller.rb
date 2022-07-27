class ApplicationController < ActionController::API
    include ActionController::Cookies

    wrap_parameters false

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    private

    def current_user
        token = request.headers['Auth-Key']
        begin
            user_id = JWT.decode(token, 'SUPER_SECRET_KEY')[0]["user_id"]
            @user = User.find_by(id: user_id)
        rescue
            nil
        end

    end

    def authenticate!
        unless current_user
            nil
        end
    end

    # def authorize_user
    #     @current_user = User.find_by(id: session[:user_id])

    #     return render json: { error: "Not Authorized" }, status: :unauthorized unless @current_user
    # end

    def render_not_found(not_found)
        render json: { error: "#{not_found.model} not found" }, status: :not_found
    end

    def render_unprocessable_entity(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
