class StudiosController < ApplicationController
  def index
    @studios = Studio.all
    # @movies = 
  end

  private

end
