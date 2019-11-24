require "dry/transaction"

class Create::Discs
  include Dry::Transaction

  step :validate_input
  step :create_album

  private

  def validate_input(input)
    validator = Dry::Validation.Schema do
      required(:artist).filled(type?: Artist)
    end

    result = validator.(input)

    if result.success?
      Success input
    else
      Failure result.errors
    end
  end

  def create_album(artist)
    disc = Create::Disc.new.(artist)

    if disc.present?
      Success disc
    else
      Failure disc.errors
    end
  end
end
