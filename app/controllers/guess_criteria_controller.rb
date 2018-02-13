class GuessCriteriaController < ApplicationController

  def show
      #@article = Article.find(params[:id])
  end

  def new
    @guess_criterium = GuessCriterium.new
    @guess_criterium.height = 0
    @guess_criterium.weight = 0
  end

  def create
    @guess_criterium = GuessCriterium.new(guess_criterium_params)

    if @guess_criterium.valid?
      #TODO add algorithm factory to retrieve an algorithm
      # Hardwired for this exercise
      algorithm_name = ManhattanDistanceAlgorithm::NAME
      algorithm = ManhattanDistanceAlgorithm.new({ height: @guess_criterium.height, weight: @guess_criterium.weight, tastes: Taste.all })
      algorithm.perform
      guess = algorithm.preference
      confidence = algorithm.confidence

      redirect_to "/guess_confirmations/new?confidence=#{confidence}&height=#{@guess_criterium.height}&weight=#{@guess_criterium.weight}&guess=#{guess}&algorithm=#{algorithm_name}"
    else
      render 'new'
    end
  end

  private

  def guess_criterium_params
    params.require(:guess_criterium).permit(:height, :weight)
  end

end
