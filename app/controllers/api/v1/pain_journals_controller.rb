module Api
  module V1
    class PainJournalsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        pain_journals = PainJournal.all.order(:created_at).reverse

        render json: PainJournalSerializer.new(pain_journals).serializable_hash.to_json
      end

      def create
        pain_journal = PainJournal.new(pain_journal_params)

        if pain_journal.save
          render json: PainJournalSerializer.new(pain_journal).serializable_hash.to_json
        else 
          render json: { error: pain_journal.errors.messages }, status: 422
        end
      end

      def update
        pain_journal = PainJournal.find_by(id: params[:id])

        if pain_journal.update(pain_journal_params)
          render json: PainJournalSerializer.new(pain_journal).serializable_hash.to_json
        else 
          render json: { error: pain_journal.errors.messages }, status: 422
        end
      end

      def destroy
        pain_journal = PainJournal.find_by(id: params[:id])

        if pain_journal.destroy
          head :no_content
        else 
          render json: { error: pain_journal.errors.messages }, status: 422
        end
      end

      private

      def pain_journal_params
        params.require(:pain_journal)
        #.transform_keys{ |key| key.to_s.underscore }
        .permit(
          :user_id, 
          :pain_score, 
          :pain_setting, 
          :pain_feeling, 
          :who_with,
          :coping_strategies, 
          :other_notes, 
          :pain_after
        )
      end

    end
  end
end