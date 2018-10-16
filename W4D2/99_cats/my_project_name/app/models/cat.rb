class Cat < ApplicationRecord
  validates :birth_date, :color, :name, :sex, :description, presence: true

  validates :sex, :inclusion => {:in => ["M","F"]}

  COLORS = {
    :Orange => 'O',
    :Purple => 'P',
    :Yellow => 'Y',
    :Black => 'B'
  }

  def age
    ((Time.now.to_date - birth_date) / 365.0).round(1)
  end

  def self.colors
    COLORS
  end
end
