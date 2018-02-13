class GuessConfirmationsController < ApplicationController

  def new
    @guess_confirmation           = GuessConfirmation.new
    @guess_confirmation.height    = params[:height]
    @guess_confirmation.weight    = params[:weight]
    @guess_confirmation.guess     = params[:guess]
    @guess_confirmation.algorithm = params[:algorithm]
  end

  def create
    @guess_confirmation = GuessConfirmation.new(guess_confirmation_params)

    # Is the incoming info valid?
    if @guess_confirmation.valid?

      # Save the person's taste/preference to
      # enhance future guesses
      taste = Taste.new
      taste.height = @guess_confirmation.height
      taste.weight = @guess_confirmation.weight

      # If the guess wasn't correct, save the opposite/correct guess.
      if @guess_confirmation.is_correct?
        taste.preference = @guess_confirmation.guess
      elsif !@guess_confirmation.is_correct? && (@guess_confirmation.guess.to_i == Taste::PREFERENCE_DOG)
        taste.preference = Taste::PREFERENCE_CAT
      elsif !@guess_confirmation.is_correct? && (@guess_confirmation.guess.to_i == Taste::PREFERENCE_CAT)
        taste.preference = Taste::PREFERENCE_DOG
      end

      result = taste.save

      #TODO create and save recommendation is_correct
      #to track the effectiveness of each algorithm

      redirect_to "/guess_criteria/new"
    else
      #TODO log, raise error, redirect to error screen
      print "\nguess_confirmation failed\n"
      render 'new'
    end

  end

private

  def guess_confirmation_params
    params.require(:guess_confirmation).permit(:height, :weight, :guess, :algorithm, :is_correct)
  end

end
