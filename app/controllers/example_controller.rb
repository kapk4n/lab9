class ExampleController < ApplicationController
  def input
  end

  def show
    @digit = params[:myParam]
  end
end
