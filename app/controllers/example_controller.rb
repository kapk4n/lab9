# frozen_string_literal: true

# created class
class ExampleController < ApplicationController
  before_action :check_par, only: [:show]

  def input; end

  def show
    if (result1 = Vichsl.find_by(digit: @digit = params[:myParam]))
      @result1 = result1.jresult
    else
      result1 = Vichsl.new(digit: @digit)
      if result1.save
        @result1 = result1.jresult
      else
        redirect_to root_path, notice: result1.errors.messages[:input][0]
      end
    end
  end

  private


  def check_par
    return if params[:myParam]&.match(/^[1-9]\d*$/)

    flash[:alert] = 'no match'
    redirect_to root_path
  end
end



# def output
#   if (result = Twin.find_by_input(@input = params[:inpt]))
#     @result = result.jresult
#   else
#     result = Twin.new(input: @input)
#     if result.save
#       @result = result.jresult
#     else
#       redirect_to root_path, notice: result.errors.messages[:input][0]
#     end
#   end
# end

# def show_db
#   # Задание с сериализацией
#   # Для отрисовки в views/layouts/application.html.erb добавили <html data-turbo='false'>
#   render xml: Twin.all
# end