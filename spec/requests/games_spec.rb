# frozen_string_literal: true

require 'swagger_helper'

describe 'Games' do
  path '/api/v1/games' do
    get 'Games' do
      tags 'Game'
      let(:user) { create(:user) }

      before do
        allow_any_instance_of(ApplicationController).to receive(:current_user) { user }
        create(:game, user_id: user.id)
      end

      response '200', 'found' do
        schema '$ref': '#/components/schemas/games'

        run_test!
      end

      # response '401', 'unauthorized' do
      #   schema '$ref': '#/components/schemas/errors'

      #   let(:Authorization) { basic_auth(user, 'ghjkl') }

      #   run_test!
      # end
    end

    post 'create Game' do
      tags 'Game'
      # security [basic_auth: []]

      let(:user) { create(:user) }

      before { allow_any_instance_of(ApplicationController).to receive(:current_user) { user } }

      parameter name: :game, in: :body, schema: { '$ref': '#/components/schemas/game_create' }

      let(:game) do
        {
          size: 4,
          number_of_mines: 3
        }
      end

      response '200', 'created' do
        schema '$ref': '#/components/schemas/game'

        run_test!
      end

      # response '401', 'unauthorized' do
      #   schema '$ref': '#/components/schemas/errors'

      #   let(:Authorization) { basic_auth(user, 'ghjkl') }

      #   run_test!
      # end
    end
  end

  path '/api/v1/games/{id}' do
    get 'Show Game' do
      tags 'Game'
      # security [basic_auth: []]

      let(:user) { create(:user) }
      let(:game) { create(:game, user_id: user.id) }

      parameter name: :id, in: :path, type: :string,
                required: true, example: 'game-id', description: 'Game id'

      response '200', 'found' do
        schema '$ref': '#/components/schemas/game'
        let!(:id) { game.id }
        run_test!
      end

      # response '401', 'unauthorized' do
      #   schema '$ref': '#/components/schemas/errors'

      #   let(:Authorization) { basic_auth(user, 'ghjkl') }

      #   run_test!
      # end
    end

    put 'update Game' do
      tags 'Game'

      let(:user) { create(:user) }
      let(:game_object) { create(:game, user_id: user.id) }

      before do
        allow_any_instance_of(ApplicationController).to receive(:current_user) { user }
      end

      parameter name: :game, in: :body, schema: { '$ref': '#/components/schemas/game_update' }
      parameter name: :id, in: :path, type: :string,
                required: true, example: 'game-id', description: 'Game id'

      let(:game) do
        {
          id: game_object.id,
          size: 4,
          number_of_mines: 3,
          ended: false,
          started: false,
          board: Array.new(4).map { Array.new(4).map { '' } }
        }
      end

      let(:id) { game_object.id }

      response '200', 'updated' do
        schema '$ref': '#/components/schemas/game'

        run_test!
      end

      # response '401', 'unauthorized' do
      #   schema '$ref': '#/components/schemas/errors'

      #   let(:Authorization) { basic_auth(user, 'ghjkl') }

      #   run_test!
      # end
    end
  end
end
