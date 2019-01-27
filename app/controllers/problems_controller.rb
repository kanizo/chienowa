class ProblemsController < ApplicationController
  def new
    @problem = Problem.new
  end  
  
  def create
    @problem = Problem.new(problem_params)
  end

  def destroy
  end
  
  # ~
  private
  def problem_params
    params.require(:problem).permit(
      Problem::ALLOWED_PARAMS,
      editors_attributes: Editor::NESTED_ALLOWED_PARAMS
    )
  end
end
