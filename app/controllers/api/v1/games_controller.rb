module Api
  module V1
    #:nodoc:
    class GamesController < ApiController
      def index
        games = Game.where(user_id: current_user.id)

        render json: games
      end

      def show
        game = Game.find_by!(id: params[:id])

        render json: game
      end

      def update
        game = Game.find_by!(id: params[:id])

        game.update!(safe_params)

        render json: game
      end

      def create
        create_params = safe_params
        create_params[:user_id] = current_user.id
        game = Game.create!(create_params)

        render json: game
      end

      private

      def safe_params
        params.permit(:size, :number_of_mines, :board, :ended, :started)
      end
    end
  end
end
