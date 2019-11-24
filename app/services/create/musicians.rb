require "dry/transaction"

class Create::Musicians
  include Dry::Transaction

  step :validate_input
  step :read_file
  tee  :authenticate
  step :create_artist

  private

  def validate_input(input)
    validator = Dry::Validation.Schema do
      configure { config.messages_file = 'config/locales/dry.yml' }
      configure { config.namespace = :file }

      required(:file_name).filled(type?: String)

      validate(invalid_file: :file_name) do |file_name|
        file_name.include?('.yml') && File.file?(file_name) && !File.zero?(file_name)
      end
    end

    result = validator.(input)

    if result.success?
      Success input
    else
      Failure result.errors
    end
  end

  def read_file(input)
    file = YAML.load_file("#{Rails.root}/#{input[:file_name]}")

    Success input.merge(file: file)
  end

  def authenticate(input)
    RSpotify::authenticate(input[:client], input[:token])
  end

  def create_artist(input)
    artists_names = input[:file].symbolize_keys[:artists].compact

    artists_names.each do |artist_name|
      Create::Musician.new.(artist_name: artist_name)
    end

    Success input
  end
end
