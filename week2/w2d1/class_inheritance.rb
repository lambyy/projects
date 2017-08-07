class Employee
  attr_reader :salary

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
      bonus = @salary * multiplier
  end
end

class Manager < Employee

  def initialize(name, title, salary, boss, *subordinates)
    @subordinates = subordinates
    super(name, title, salary, boss)
  end

  def bonus(multiplier)
    total_salary = @subordinates.map do |subordinate|
      subordinate.salary
    end.reduce(:+)
    bonus = total_salary * multiplier
  end
end

if __FILE__ == $PROGRAM_NAME
  david = Employee.new("David", "TA", 10000, "Darren")
  shwana = Employee.new("Shwana", "TA", 12000, "Darren")
  darren = Manager.new("Darren", "TA Manager", 78000, "Ned", david, shwana)
  ned = Manager.new("Ned", "Founder", 1000000, nil, darren, david, shwana)
  p ned.bonus(5)
  p darren.bonus(4)
  p david.bonus(3)
end
