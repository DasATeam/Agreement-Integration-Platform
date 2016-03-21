class TermController < ApplicationController
  def index
    @term = Point.first

    render "index"
  end

  def agree
  end
end
