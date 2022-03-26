module Api
  module V1
    class EducationModulesController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        education_modules = EducationModule.all

        render json: EducationModuleSerializer.new(education_modules).serializable_hash.to_json
      end

      def create
        education_module = EducationModule.new(education_module_params)

        if education_module.save
          render json: EducationModuleSerializer.new(education_module).serializable_hash.to_json
        else 
          render json: { error: education_module.errors.messages }, status: 422
        end
      end

      def update
        education_module = EducationModule.find_by(params[:module_id])

        if education_module.update(education_module_params)
          render json: EducationModuleSerializer.new(education_module).serializable_hash.to_json
        else 
          render json: { error: education_module.errors.messages }, status: 422
        end
      end

      private

      def education_module_params
        params.require(:education_module).permit(:user_id, :module_id, :status)
      end

    end
  end
end