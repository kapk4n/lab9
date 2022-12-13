# frozen_string_literal: true

# created class
class ExampleController < ApplicationController
  before_action :check_par, only: [:show]
  before_action :require_user_logged_in!

  # before_action :require_user_present!

  def input; end

  def show
    @result = vichsl(params[:myParam].to_f)
  end

  private

  def vichsl(dig)
    @a = []
    @x0 = dig
    @x1 = @x0 + 1
    while ((@x1**2 - dig) / dig) >= 0.001
      extra = @x1
      @x0 = extra
      @x1 = 0.5 * (@x0 + dig / @x0)
      @a.push(@x1)
    end
    @a
  end

  def check_par
    return if params[:myParam]&.match(/^[1-9]\d*$/)

    flash[:alert] = 'no match'
    redirect_to example_input_path
  end
end
