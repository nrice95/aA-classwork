class Employee

  def initialize(name,title,salary,boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    boss.employees << self unless boss.nil?
  end

  def bonus(multiplier)
    self.salary * multiplier
  end

  protected
  attr_reader :name, :title, :salary, :boss
end
