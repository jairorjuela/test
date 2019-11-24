require "dry/transaction"

class Create::Melodies
  include Dry::Transaction

  step :validate_input
  step :create_album

  private

  def validate_input(input)
    validator = Dry::Validation.Schema do
      required(:album).filled(type?: Album)
    end

    result = validator.(input)

    if result.success?
      Success input
    else
      Failure result.errors
    end
  end

  def create_album(album)
    one_album = Create::Melody.new.(album)

    if one_album.present?
      Success one_album
    else
      Failure one_album.errors
    end
  end
end
