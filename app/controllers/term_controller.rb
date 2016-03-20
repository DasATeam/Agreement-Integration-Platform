class TermController < ApplicationController
  def index
    @term = Point.first

    render "index"
  end
end
