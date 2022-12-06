class Vichsl < ApplicationRecord
  validates_uniqueness_of :digit, message: 'Введено не уникальное значение'
  # validates :input, format: { with: /\A\d+\z/, message: 'Должно быть введено положительное число' }
  before_save :set_sqrts

  def jresult
    ActiveSupport::JSON.decode(result)
  end

  private

  def set_sqrts
    self.result = ActiveSupport::JSON.encode(vich_sqrt)
  end

  def vich_sqrt
    a = []
    @x0 = digit
    @x1 = @x0 + 1
    while ((@x1**2 - digit) / digit) >= 0.001
      extra = @x1
      @x0 = extra
      @x1 = 0.5 * (@x0 + digit / @x0)
      a.push(@x1)
    end
    return a unless a.length.zero?
    nil
  end
end
