# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      paths: {},
      servers: [
        {
          url: 'https://{defaultHost}',
          variables: {
            defaultHost: {
              default: 'www.example.com'
            }
          }
        }
      ],
      tags: %w[minesweeper game user api],

      components: {
        securitySchemes: {
          bearer: {
            description: 'JWT key necessary to use API calls',
            type: :apiKey,
            name: 'Authorization',
            in: :header
          },
          basic_auth: {
            description: 'Basic Auth credentials',
            type: :http,
            scheme: :basic
          }
        },
        schemas: {
          not_found: {
            type: :object,
            additionalProperties: true
          },
          unauthorized: {
            type: :object,
            additionalProperties: true
          },
          errors: {
            type: :object,
            additionalProperties: false
          },
          game: {
            type: :object,
            additionalProperties: false,
            properties: {
              id: { type: :integer },
              user_id: { type: :integer },
              size: { type: :integer },
              number_of_mines: { type: :integer },
              ended: { type: :boolean },
              started: { type: :boolean },
              board: { type: :array }
            }
          },
          game_create: {
            type: :object,
            additionalProperties: false,
            properties: {
              user_id: { type: :integer },
              size: { type: :integer },
              number_of_mines: { type: :integer },
              ended: { type: :boolean, nullable: true},
              started: { type: :boolean, nullable: true },
              board: { type: :array, nullable: true}
            }
          },
          game_update: {
            type: :object,
            additionalProperties: false,
            properties: {
              id: { type: :integer },
              user_id: { type: :integer, nullable: true },
              size: { type: :integer, nullable: true },
              number_of_mines: { type: :integer, nullable: true },
              ended: { type: :boolean, nullable: true},
              started: { type: :boolean, nullable: true },
              board: { type: :array, nullable: true}
            }
          },
          games: {
            type: :array, items: {
              '$ref': '#/components/schemas/game'
            }
          },
          user: {
            type: :object,
            additionalProperties: false,
            properties: {
              email: { type: :string }
            }
          }
        }
      }
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The swagger_docs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.swagger_format = :yaml
end
