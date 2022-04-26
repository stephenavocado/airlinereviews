module Api
  module V1
    class MoodJournalsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        mood_journals = MoodJournal.all.order(:created_at).reverse

        render json: MoodJournalSerializer.new(mood_journals).serializable_hash.to_json
      end

      def create
        mood_journal = MoodJournal.new(mood_journal_params)

        if mood_journal.save
          render json: MoodJournalSerializer.new(mood_journal).serializable_hash.to_json
        else 
          render json: { error: mood_journal.errors.messages }, status: 422
        end
      end

      def update
        mood_journal = MoodJournal.find_by(id: params[:id])

        if mood_journal.update(mood_journal_params)
          render json: MoodJournalSerializer.new(mood_journal).serializable_hash.to_json
        else 
          render json: { error: mood_journal.errors.messages }, status: 422
        end
      end

      def destroy
        mood_journal = MoodJournal.find_by(id: params[:id])

        if mood_journal.destroy
          head :no_content
        else 
          render json: { error: mood_journal.errors.messages }, status: 422
        end
      end

      private

      def mood_journal_params
        params.require(:mood_journal)
        .permit(
          :user_id, 
          :feeling, 
          :intensity, 
          :situation, 
          :who_i_was_with,
          :primary_thought, 
          :cognitive_distortions
        )
      end

    end
  end
end