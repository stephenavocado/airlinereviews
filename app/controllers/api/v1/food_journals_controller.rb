module Api
  module V1
    class FoodJournalsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        food_journals = FoodJournal.all

        render json: FoodJournalSerializer.new(food_journals).serializable_hash.to_json
      end

      def create
        food_journal = FoodJournal.new(food_journal_params)

        if food_journal.save
          render json: FoodJournalSerializer.new(food_journal).serializable_hash.to_json
        else 
          render json: { error: food_journal.errors.messages }, status: 422
        end
      end

      def update
        food_journal = FoodJournal.find_by(id: params[:id])

        if food_journal.update(food_journal_params)
          render json: FoodJournalSerializer.new(food_journal).serializable_hash.to_json
        else 
          render json: { error: food_journal.errors.messages }, status: 422
        end
      end

      private

      def food_journal_params
        params.require(:food_journal)
        #.transform_keys{ |key| key.to_s.underscore }
        .permit(:user_id, :breakfast, :lunch, :dinner, :snacks)
      end

    end
  end
end