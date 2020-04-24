class Customer
    attr_accessor :name, :age
    @@all = []
  def initialize(name,age)
    @name = name
    @age = age

    Customer.all<<self
  end
  def self.all
    @@all
  end

  def new_meal(waiter,total,tip)
    Meal.new(waiter,self,total,tip)
  end

  def meals
    Meal.all.select do |i|
        i.customer == self
    end
  end

  def waiters
    meals.map do |i|
        i.waiter
    end
  end
end
