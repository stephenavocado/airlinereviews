module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :verify_authenticity_token

      def create
        user = User.new(user_params)

        if user.save
          render json: UserSerializer.new(user).serialized_json
        else 
          render json: { error: user.errors.messages }, status: 422
        end
      end

      def update
        user = User.find_by(uid: params[:id])

        if user.update(user_params)
          render json: UserSerializer.new(user).serializable_hash.to_json
        else 
          render json: { error: user.errors.messages }, status: 422
        end
      end

      def destroy
        user = User.find_by(uid: params[:uid])

        if user.destroy
          head :no_content
        else 
          render json: { error: user.errors.messages }, status: 422
        end
      end

      private

      def user
        @user ||= User.find_by(uid: params[:id])
      end
      
      def user_params
        params
        .require(:user)
        .transform_keys{ |key| key.to_s.underscore }
        .permit(:name, :role, :uid, :program_pace_goal, :avg_pain_pre_start)
      end
    end
  end
end
